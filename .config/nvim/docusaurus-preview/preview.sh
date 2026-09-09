#!/usr/bin/env bash
set -euo pipefail

preview_root="$(cd "$(dirname "$0")" && pwd -P)"
source_file="${1:-}"
open_browser="${2:-yes}"
port=39127
pid_file="$preview_root/preview.pid"
log_file="$preview_root/preview.log"
source_state_file="$preview_root/preview.source"
preview_url="http://localhost:$port/"

if [[ -z "$source_file" || ! -f "$source_file" ]]; then
  printf 'Markdown file does not exist: %s\n' "$source_file" >"$log_file"
  exit 1
fi

source_file="$(cd "$(dirname "$source_file")" && pwd -P)/$(basename "$source_file")"
temporary_state_file="${source_state_file}.tmp.$$"
printf '%s\n' "$source_file" >"$temporary_state_file"
mv "$temporary_state_file" "$source_state_file"

server_is_ready() { curl --silent --fail --max-time 1 "http://localhost:$port/api/document" >/dev/null; }

if server_is_ready; then
  [[ "$open_browser" == "yes" ]] && open "$preview_url"
  exit 0
fi

if [[ ! -f "$preview_root/build/index.html" ]]; then
  cd "$preview_root"
  npm run build >>"$log_file" 2>&1
fi

: >"$log_file"
cd "$preview_root"
nohup npm run start </dev/null >>"$log_file" 2>&1 &
server_pid=$!
printf '%s\n' "$server_pid" >"$pid_file"

for _ in {1..40}; do
  if server_is_ready; then
    [[ "$open_browser" == "yes" ]] && open "$preview_url"
    exit 0
  fi
  kill -0 "$server_pid" 2>/dev/null || exit 1
  sleep 0.05
done
printf 'Timed out waiting for %s\n' "$preview_url" >>"$log_file"
exit 1
