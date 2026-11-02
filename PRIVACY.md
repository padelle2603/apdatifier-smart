# Privacy Policy

**apdatifier** (with smart notifications) is an Arch Linux update notifier plasmoid for KDE Plasma 6.

This software operates purely locally on your device and follows strict privacy-by-design principles.

## No Network Connections

- **No HTTP or network requests.** The plasmoid contains no network code, no HTTP client, no analytics, and no remote telemetry.
- **Zero data transmission.** No package lists, update information, device metrics, or diagnostic data are ever transmitted to any remote server or third party.
- **Exception: RSS feeds (optional).** If you explicitly enable RSS feed monitoring in settings and provide feed URLs, the plasmoid will fetch those feeds to display Arch Linux news. This feature is disabled by default and requires manual configuration.

## Local Data & Storage

- **Package database:** The plasmoid reads package information from your local system using standard Arch Linux tools (`pacman`, `checkupdates`, `flatpak`, `fwupdmgr`). No package data is stored permanently by the widget.
- **Cache file:** A temporary cache of pending updates is stored locally in `~/.cache/apdatifier/updates.json` to compare version bumps between checks.
- **Configuration:** Widget preferences (check interval, smart notifications settings, size threshold, rules) are managed by KDE Plasma and stored locally in `~/.config/apdatifier/config.conf`.
- **No tracking:** No usage history, statistics, or behavioral data is collected or stored.

## Permissions

The plasmoid runs under standard user session permissions:
- **Read-only access** to the local package database (`/var/lib/pacman/sync/`, Flatpak remotes).
- **Execute permissions** for system package managers (`pacman`, `flatpak`, `fwupdmgr`) to query available updates.
- **No elevated privileges** are required for checking updates. System upgrades require explicit user confirmation and utilize your configured privilege escalation tool (typically `sudo`).

## Smart Notifications

The "smart notifications" feature analyzes package names locally using predefined regex patterns to classify updates as critical, important, or minor. No external services or databases are consulted. Package size thresholds are evaluated locally from cached package metadata.

## Contact

For privacy or security concerns, open an issue on the project repository:
<https://github.com/padelle/apdatifier-smart/issues>

Refer to [LEGAL.md](LEGAL.md) for legal terms and [LICENSE](LICENSE) for licensing conditions.
