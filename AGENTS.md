# apdatifier-smart - AGENTS.md

## Quick facts

- **Scope:** Arch Update Notifier plasmoid for KDE Plasma 6 with smart notifications
- **Version bump:** manual in `package/metadata.json`, field `"Version"`
- **Commands:** 
  - `qmllint` on all `.qml` files
  - `node --check` on all `.js` files
  - Launch via `plasmawindowed com.github.exequtic.apdatifier` without warnings

## Quality gate

1. `qmllint` clean on all `.qml` files (no warnings/errors)
2. JavaScript syntax validation with `node --check` on `tools/*.js`
3. Valid JSON in `package/metadata.json`
4. Launch in `plasmawindowed com.github.exequtic.apdatifier` without QML console warnings
5. Manual verification:
   - Smart notifications enabled/disabled toggle works
   - Critical packages (kernel, nvidia) trigger immediate red notification
   - Important packages (steam, wine) trigger immediate orange notification
   - Minor packages < 500MB produce no notification
   - Badge colors: red for critical, orange for important, gray for minor
   - Size threshold slider (50-5000 MB) functional

## Commit scopes

Valid scopes for Conventional Commits `<type>(<scope>):`:

- `notifications` — notification logic, urgency, filtering
- `ui` — panel badge, configuration UI
- `core` — package detection, parsing, priority rules
- `scripts` — installation, update, check scripts
- `docs` — README, PRIVACY, LEGAL, MANIFEST

## Technical choices

- **Zero new dependencies** — only system tools already installed (`pacman`, `flatpak`, `kpackagetool6`)
- **Pure QML/JavaScript** — no C++ compilation required
- **Privacy-first** — local-only operation, no network calls
- **Fork maintenance** — periodically sync with upstream `exequtic/apdatifier`

## Smart Notifications Logic

### Critical packages (immediate CriticalUrgency notification):
- Kernel: `linux*`, `linux-firmware*`
- Drivers: `nvidia*`, `lib32-nvidia*`, `mesa`, `lib32-mesa`, `vulkan-*`
- Security: `openssl`, `gnutls`, `sudo`, `polkit`, `ssh`, `gnupg`
- System: `systemd`, `glibc`, `gcc-libs`, `grub`, `pam`

### Important packages (immediate HighUrgency notification):
- Gaming: `steam*`, `wine*`, `proton*`, `lutris`, `heroic*`
- Gaming tools: `dxvk`, `vkd3d`, `mangohud`, `gamescope`, `umu-launcher`
- Emulators: `pcsx2`, `dolphin-emu`, `rpcs3`, `citra`, `yuzu`, `ryujinx`
- Communication: `discord`, `teams`, `slack`, `teamspeak`

### Minor packages:
- Size >= threshold (default 500MB): normal notification
- Size < threshold: no notification

## Known limitations

- Pattern matching is case-sensitive regex
- Flatpak size parsing uses `IS` (Installed Size) field
- Package priorities can be overridden via user Rules
