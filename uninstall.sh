#!/bin/bash
set -euo pipefail

CYAN='\033[0;36m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${PURPLE}🔄 Restoring stock Omarchy menu...${NC}\n"

USER_PREFIX="$(id -un)"
CONFIG_DIR="$HOME/.config/omarchy"
PLUGINS_DIR="$CONFIG_DIR/plugins"
TARGET_DIR="$PLUGINS_DIR/$USER_PREFIX.menu"

if command -v omarchy >/dev/null 2>&1; then
    echo -e "${BLUE}🔌 Disabling $USER_PREFIX.menu and enabling omarchy.menu...${NC}"
    omarchy plugin disable "$USER_PREFIX.menu" >/dev/null 2>&1 || true
    omarchy plugin enable "omarchy.menu" >/dev/null 2>&1 || true
fi

if [ -d "$TARGET_DIR" ]; then
    echo -e "${BLUE}🗑️ Removing ${TARGET_DIR}...${NC}"
    rm -rf "$TARGET_DIR"
fi

echo -e "\n${GREEN}✔ Default Omarchy menu restored successfully.${NC}\n"
