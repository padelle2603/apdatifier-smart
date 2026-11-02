<div align="center">

# Apdatifier Smart
### Arch Update Notifier with Smart Notifications

<br>

![License](https://img.shields.io/github/license/padelle/apdatifier-smart?style=flat&logo=gnu&logoColor=white&label=License&color=brown)&nbsp;&nbsp;
![Fork](https://img.shields.io/badge/Fork-exequtic%2Fapdatifier-blue?style=flat&logo=github)

<br>

</div>

**A fork of [apdatifier](https://github.com/exequtic/apdatifier) that adds intelligent priority-based notification filtering for Arch Linux gamers and power users.**

## What's Different in This Fork

This fork adds **Smart Notifications** — an optional feature that filters update notifications based on package priority and size:

- 🔴 **Critical packages** (kernel, drivers, security) → Immediate red notification
- 🟠 **Important packages** (gaming stack, communication) → Immediate orange notification  
- 🔇 **Minor packages under 500MB** → No notification (configurable threshold)
- 📦 **Minor packages over 500MB** → Normal notification

**Smart notifications are disabled by default** — the widget works exactly like the original unless you enable this feature in settings.

---

## Features

All original apdatifier features, plus:

### From Upstream
- Searching updates for [pacman](https://archlinux.org/packages/), [AUR](https://aur.archlinux.org/packages), [Plasma Widgets](https://store.kde.org/browse?cat=705), [Flatpak](https://flathub.org), [Firmware](https://fwupd.org/lvfs/vendors/)
- Notifications for updates and news
- Bash script with useful options for managing packages
- Full system upgrade in the selected [terminal](#supported-terminals)
- Refresh the [mirrorlist](https://archlinux.org/mirrorlist) with the latest mirrors filtered by speed
- Works on non-Arch-based systems (for Plasma Widgets, Flatpak, Firmware)

### Smart Notifications (New)
- **Priority-based filtering:** Critical and important packages notify immediately; minor packages under the size threshold are silent.
- **Colored badge:** Panel badge turns red for critical updates, orange for important updates, gray for minor updates.
- **Gaming-focused patterns:** Automatically detects Steam, Wine, Proton, DXVK, emulators, and gaming tools as important.
- **Configurable threshold:** Adjust the minor package size threshold (50-5000 MB, default 500MB).
- **User overrides:** The original Rules system takes precedence over automatic classification.

---

## Requirements

### Mandatory
- KDE Plasma 6.0+
- `pacman` (Arch Linux package manager)
- `kpackagetool6` (included with Plasma)

### Optional Dependencies
- `paru`, `yay`, `pikaur` — for AUR updates support
- `flatpak` — for Flatpak updates support
- `fwupdmgr` — for Firmware updates support
- `jq` — for KDE Widgets updates and News
- `tmux` — for upgrade and management in a terminal multiplexer
- `fzf` — for interactive package selection in management

### Supported Terminals
alacritty, foot, gnome-terminal, ghostty, konsole, kitty, lxterminal, ptyxis, terminator, tilix, xterm, yakuake, wezterm

Flatpak installations of these terminals are also supported.

---

## Installation

### From Source (This Fork)

```bash
git clone https://github.com/padelle/apdatifier-smart.git
cd apdatifier-smart
./scripts/install.sh
```

The installation script will:
1. Run quality checks (`qmllint`, JSON validation)
2. Install or upgrade the plasmoid using `kpackagetool6`
3. Optionally restart Plasma Shell

### Manual Installation

```bash
kpackagetool6 --type Plasma/Applet --install package
# or for upgrade:
kpackagetool6 --type Plasma/Applet --upgrade package
```

### Add to Panel

1. Right-click your KDE panel → **Enter Edit Mode** (or press `Meta+Alt+D`)
2. Click **Add Widgets…** and search for `apdatifier`
3. Drag the widget onto your panel or system tray

---

## Configuration

### Enable Smart Notifications

1. Right-click the widget → **Configure**
2. Go to the **Notifications** tab
3. Check **"Smart notifications"**
4. Adjust the size threshold if needed (default: 500MB)

### Package Priority Detection

**Critical packages** (always notify):
- Kernel: `linux*`, `linux-firmware*`
- Drivers: `nvidia*`, `mesa`, `vulkan-*`
- Security: `openssl`, `sudo`, `polkit`, `ssh`, `gnupg`
- System: `systemd`, `glibc`, `grub`

**Important packages** (always notify):
- Gaming: `steam*`, `wine*`, `proton*`, `lutris`, `heroic*`
- Gaming tools: `dxvk`, `vkd3d`, `mangohud`, `gamescope`
- Emulators: `pcsx2`, `dolphin-emu`, `rpcs3`, `yuzu`, `ryujinx`
- Communication: `discord`, `teams`, `slack`, `teamspeak`

**Minor packages**:
- Size ≥ threshold: normal notification
- Size < threshold: no notification

See [AGENTS.md](AGENTS.md) for the complete list of patterns.

---

## Development

### Quality Checks

```bash
./scripts/check.sh
```

Runs `qmllint` on QML files, validates JavaScript syntax, and checks JSON validity.

### Testing

Launch the plasmoid in a standalone window:

```bash
plasmawindowed com.github.exequtic.apdatifier
```

### Update from Upstream

To sync with the original apdatifier project:

```bash
git remote add upstream https://github.com/exequtic/apdatifier.git
git fetch upstream
git merge upstream/main
```

---

## What It Does Not Do

- **It does not modify the original notification system** — Smart notifications are opt-in and disabled by default.
- **It does not make additional network calls** — All package classification happens locally using regex patterns.
- **It does not require new dependencies** — Uses only tools already required by the upstream project.

---

## Uninstalling

```bash
kpackagetool6 --type Plasma/Applet --remove com.github.exequtic.apdatifier
```

Or remove all related files (config, icons, notifyrc):

```bash
bash ~/.local/share/plasma/plasmoids/com.github.exequtic.apdatifier/contents/tools/sh/utils uninstall
```

---

## Documents

- [LICENSE](LICENSE) — MIT License (same as upstream)
- [PRIVACY.md](PRIVACY.md) — Privacy statement (zero network, zero data collection)
- [LEGAL.md](LEGAL.md) — Legal notices, upstream attribution, and trademark acknowledgments
- [MANIFEST.md](MANIFEST.md) — Project vision, fork rationale, and maintenance strategy
- [AGENTS.md](AGENTS.md) — Development rules, quality gates, and commit scopes

---

## Credits

This is a fork of [apdatifier](https://github.com/exequtic/apdatifier) by **Evgeny Kazantsev (exequtic)**.

All credit for the original widget design, architecture, and features goes to the upstream project. This fork only adds optional smart notification filtering.

**Support the original author:**
- [Buy Me a Coffee](https://www.buymeacoffee.com/evgk)
- [NOWPayments](https://nowpayments.io/donation/exequtic)

---

## License

MIT License — Copyright © 2023 Evgeny Kazantsev (upstream), 2026 Paolo D'Elia (fork modifications)

See [LICENSE](LICENSE) for full terms.
