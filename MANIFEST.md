# Project Manifest

## Origin & Motivation

**apdatifier** by Evgeny Kazantsev (exequtic) is a comprehensive Arch Linux update notifier for KDE Plasma that monitors packages from official repositories, AUR, Flatpak, Plasma widgets, and firmware updates. It provides a unified interface for checking and installing updates with configurable scheduling and notification options.

While the original plasmoid excels at comprehensive update monitoring, users managing systems with frequent minor package updates (particularly gaming rigs with many Steam/Proton/Wine components) often face notification fatigue: dozens of daily notifications for small library updates alongside critical kernel or driver updates.

**apdatifier-smart** addresses this by introducing intelligent priority-based notification filtering:
- **Critical packages** (kernel, drivers, security) trigger immediate high-urgency notifications with red badges.
- **Important packages** (gaming stack, communication apps) trigger immediate notifications with orange badges.
- **Minor packages** below a configurable size threshold (default 500MB) produce no notifications to reduce noise.

This fork preserves all original functionality while adding a single optional toggle: "Smart notifications," disabled by default to maintain backward compatibility.

## Vision & Principles

1. **Upstream Compatibility First:** This fork tracks the upstream `exequtic/apdatifier` project and periodically merges updates to avoid divergence. All original features remain intact and functional.

2. **Opt-In Enhancement:** Smart notifications are disabled by default. Users who prefer the original notification behavior need not change anything.

3. **Privacy & Local Operation:** Like the upstream project, this fork makes no external network requests (except optional user-configured RSS feeds). All package classification happens locally using predefined regex patterns.

4. **Zero New Dependencies:** No additional system packages, libraries, or binaries are required beyond what the original apdatifier needs (`pacman`, `flatpak`, `kpackagetool6`).

5. **Gaming-Focused Prioritization:** The default important package patterns specifically target Linux gaming infrastructure (Steam, Wine, Proton, DXVK, emulators) based on the needs of Arch Linux gaming setups.

6. **User Overrides via Rules:** The original apdatifier's "Rules" system (custom package filters with icons and importance flags) takes precedence over automatic classification, allowing per-user customization.

## Maintenance Strategy

- **Upstream sync:** Regularly fetch and merge changes from `exequtic/apdatifier` main branch.
- **Quality gate:** All commits pass `qmllint`, JavaScript syntax validation, and manual verification before merge.
- **Documentation:** Maintain separate PRIVACY.md, LEGAL.md, and this MANIFEST.md to clearly document the fork's scope and differences.

## Cross-References

- [README.md](README.md) — Installation, usage, and feature overview.
- [LICENSE](LICENSE) — MIT License (same as upstream).
- [PRIVACY.md](PRIVACY.md) — Privacy policy and local operation details.
- [LEGAL.md](LEGAL.md) — Upstream attribution and trademark acknowledgments.
- [AGENTS.md](AGENTS.md) — Development rules, quality gates, and commit scopes.
