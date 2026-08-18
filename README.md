# Omarchy Refined Menu

A sleek, refined UI/UX enhancement for the [Omarchy](https://github.com/omarchy/omarchy) Quickshell application launcher and command palette.

## ✨ Features

- **App Priority Search:** Installed applications always rank at the top over installer scripts and system actions.
- **Single-Line Layout:** Clean vertical alignment for item titles, preserving muscle memory and rapid scanning.
- **Subtle Right-Aligned Categories:** Clean, monochrome category breadcrumbs (`Apps`, `Install › Development`, `Setup › Network › DNS`, `System`) aligned on the right.
- **Contextual Action Footer:** Instant feedback showing what pressing `Enter` will do for the currently highlighted item (`Launch Google Chrome`, `Run installer for Go`, `Execute Logout`).
- **Seamless & Safe:** Installed as an isolated user-level Omarchy plugin (`$USER.menu`), ensuring core Omarchy updates won't overwrite your setup.

## 🚀 Quick Install

### One-Line Install (GitHub)
```bash
curl -sSL "https://raw.githubusercontent.com/Praveensenpai/omarchy-refined-menu/HEAD/install.sh" | bash
```

### Manual Install
```bash
git clone https://github.com/Praveensenpai/omarchy-refined-menu.git
cd omarchy-refined-menu
chmod +x install.sh
./install.sh
```

## 🔄 Uninstall / Restore Stock Menu

### One-Line Uninstall
```bash
curl -sSL "https://raw.githubusercontent.com/Praveensenpai/omarchy-refined-menu/HEAD/uninstall.sh" | bash
```

### Manual Uninstall
```bash
chmod +x uninstall.sh
./uninstall.sh
```
