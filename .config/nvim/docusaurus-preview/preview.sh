#!/usr/bin/env bash

set -euo pipefail

preview_root="$(cd "$(dirname "$0")" && pwd -P)"
source_file="${1:-}"
open_browser="${2:-yes}"
port=39127
pid_file="$preview_root/preview.pid"
log_file="$preview_root/preview.log"
source_state_file="$preview_root/preview.source"

if [[ -z "$source_file" || ! -f "$source_file" ]]; then
  printf 'Markdown file does not exist: %s\n' "$source_file" >"$log_file"
  exit 1
fi

source_file="$(cd "$(dirname "$source_file")" && pwd -P)/$(basename "$source_file")"
document_name="$(basename "$source_file")"
document_slug="${document_name%.*}"
preview_url="http://localhost:$port/$document_slug"

if [[ -f "$pid_file" && -f "$source_state_file" ]]; then
  existing_pid="$(<"$pid_file")"
  existing_source="$(<"$source_state_file")"
  if [[ "$existing_pid" =~ ^[0-9]+$ ]] &&
    [[ "$existing_source" == "$source_file" ]] &&
    kill -0 "$existing_pid" 2>/dev/null &&
    curl --silent --fail "$preview_url" >/dev/null; then
    if [[ "$open_browser" == "yes" ]]; then
      open "$preview_url"
    fi
    exit 0
  fi
fi

terminate_process_tree() {
  local parent_pid="$1"
  local child_pid

  while read -r child_pid; do
    if [[ -n "$child_pid" ]]; then
      terminate_process_tree "$child_pid"
    fi
  done < <(pgrep -P "$parent_pid" 2>/dev/null || true)

  kill "$parent_pid" 2>/dev/null || true
}

if [[ -f "$pid_file" ]]; then
  previous_pid="$(<"$pid_file")"
  if [[ "$previous_pid" =~ ^[0-9]+$ ]] && kill -0 "$previous_pid" 2>/dev/null; then
    terminate_process_tree "$previous_pid"
  fi
fi

for _ in {1..40}; do
  if ! lsof -nP -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; then
    break
  fi
  sleep 0.1
done

: >"$log_file"
cd "$preview_root"
nohup env DOCUSAURUS_PREVIEW_FILE="$source_file" npm run start -- --host localhost --port "$port" \
  </dev/null >>"$log_file" 2>&1 &
server_pid=$!
printf '%s\n' "$server_pid" >"$pid_file"
printf '%s\n' "$source_file" >"$source_state_file"

for _ in {1..120}; do
  if curl --silent --fail "$preview_url" >/dev/null; then
    if [[ "$open_browser" == "yes" ]]; then
      open "$preview_url"
    fi
    exit 0
  fi
  if ! kill -0 "$server_pid" 2>/dev/null; then
    exit 1
  fi
  sleep 0.25
done

printf 'Timed out waiting for %s\n' "$preview_url" >>"$log_file"
exit 1
