# Enhanced Omarchy Menu

A sleek, refined UI/UX enhancement for the [Omarchy](https://github.com/omarchy/omarchy) Quickshell application launcher and command palette.

## ✨ Features

- **Single-Line Layout:** Clean vertical alignment for item titles, preserving muscle memory and rapid scanning.
- **Right-Aligned Category Badges (Pills):** Replaces stacked low-contrast subtitles with elegant, color-coded category pills (`Apps`, `Install`, `Setup`, `System`).
- **Contextual Action Footer:** Instant feedback showing what pressing `Enter` will do for the currently highlighted item (`Launch App`, `Run Installer`, `Configure DNS`, `End Session`).
- **Seamless & Isolated:** Installed as a user-level Omarchy plugin (`$USER.menu`), ensuring updates to Omarchy core won't break your customizations.

## 🚀 Quick Install

### One-Line Install (GitHub)
```bash
curl -sSL "https://raw.githubusercontent.com/Praveensenpai/omarchy-menu/main/install.sh" | bash
```

### Manual Install
```bash
git clone https://github.com/Praveensenpai/omarchy-menu.git
cd omarchy-menu
chmod +x install.sh
./install.sh
```

## 🔄 Uninstall / Restore Default
```bash
chmod +x uninstall.sh
./uninstall.sh
```
