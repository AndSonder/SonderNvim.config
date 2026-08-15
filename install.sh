#!/usr/bin/env sh

set -eu

info() {
  printf "[info] %s\n" "$1"
}

warn() {
  printf "[warn] %s\n" "$1"
}

err() {
  printf "[error] %s\n" "$1" >&2
}

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"
NVIM_DIR="${HOME}/.config/nvim"
REPO_NVIM_DIR="${REPO_ROOT}/.config/nvim"
REPO_INIT="${REPO_ROOT}/init.lua"
BACKUP_SUFFIX="$(date +%Y%m%d_%H%M%S)"

if ! command -v nvim >/dev/null 2>&1; then
  err "nvim not found in PATH. Install Neovim first."
  exit 1
fi

if [ ! -d "$REPO_NVIM_DIR" ] && [ ! -f "$REPO_INIT" ]; then
  err "No nvim config found in repository."
  err "Expected either ${REPO_NVIM_DIR}/init.lua or ${REPO_ROOT}/init.lua"
  exit 1
fi

mkdir -p "${HOME}/.config"

if [ -e "$NVIM_DIR" ] || [ -L "$NVIM_DIR" ]; then
  BACKUP_DIR="${NVIM_DIR}.bak.${BACKUP_SUFFIX}"
  warn "Existing Neovim config detected, backup to: ${BACKUP_DIR}"
  mv "$NVIM_DIR" "$BACKUP_DIR"
fi

if [ -d "$REPO_NVIM_DIR" ]; then
  ln -s "$REPO_NVIM_DIR" "$NVIM_DIR"
  info "Linked ${NVIM_DIR} -> ${REPO_NVIM_DIR}"
else
  mkdir -p "$NVIM_DIR"
  ln -s "$REPO_INIT" "$NVIM_DIR/init.lua"
  info "Linked ${NVIM_DIR}/init.lua -> ${REPO_INIT}"
fi

info "Done. Start Neovim and run once to let lazy.nvim bootstrap plugins."
info "If you want to sync plugins now, run:"
info "  nvim --headless '+Lazy! sync' +qa"
