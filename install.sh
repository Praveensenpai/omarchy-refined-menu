#!/bin/bash
set -euo pipefail

CYAN='\033[0;36m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${PURPLE}🚀 Installing Omarchy Refined Menu...${NC}\n"

if ! command -v omarchy >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Omarchy is not installed on this system. Exiting.${NC}"
    exit 1
fi

USER_PREFIX="$(id -un)"
CONFIG_DIR="$HOME/.config/omarchy"
PLUGINS_DIR="$CONFIG_DIR/plugins"
TARGET_DIR="$PLUGINS_DIR/$USER_PREFIX.menu"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PLUGIN_DIR="$SCRIPT_DIR/plugin"

# Ensure plugin directory exists
mkdir -p "$PLUGINS_DIR"

# Backup existing user plugin if present
if [ -d "$TARGET_DIR" ]; then
    BACKUP_DIR="$CONFIG_DIR/backups/${USER_PREFIX}.menu.backup.$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$CONFIG_DIR/backups"
    echo -e "${BLUE}📦 Backing up existing plugin to ${BACKUP_DIR}...${NC}"
    cp -r "$TARGET_DIR" "$BACKUP_DIR"
fi

# Copy plugin files
echo -e "${BLUE}📂 Deploying plugin to ${TARGET_DIR}...${NC}"
mkdir -p "$TARGET_DIR"
cp -r "$SOURCE_PLUGIN_DIR"/* "$TARGET_DIR/"

# Update manifest with user prefix
sed -i "s/\"id\": \"[^\"]*\"/\"id\": \"$USER_PREFIX.menu\"/" "$TARGET_DIR/manifest.json"

# Validate the installed plugin
if command -v omarchy >/dev/null 2>&1; then
    omarchy plugin validate "$TARGET_DIR"
fi

# Enable the user plugin
echo -e "${BLUE}🔌 Enabling $USER_PREFIX.menu plugin...${NC}"
omarchy plugin enable "$USER_PREFIX.menu"

# Restart Omarchy shell to reload QML and compiled JS modules
if command -v omarchy >/dev/null 2>&1; then
    echo -e "${BLUE}🔄 Restarting Omarchy Shell...${NC}"
    omarchy restart shell >/dev/null 2>&1 || true
fi

echo -e "\n${GREEN}✔ Enhanced Omarchy Menu installed successfully!${NC}"
echo -e "${CYAN}Press Super+Space or your menu shortcut to enjoy the enhanced UI.${NC}\n"
