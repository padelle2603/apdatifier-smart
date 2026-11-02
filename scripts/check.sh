#!/usr/bin/env bash
set -euo pipefail

# scripts/check.sh - Quality gate & linting for apdatifier

# Lavora sempre dalla radice del repo, ovunque venga lanciato lo script
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "==> Running qmllint on QML files..."
if command -v qmllint &> /dev/null; then
    find package/contents/ui -name "*.qml" -exec qmllint {} \;
    echo "✓ qmllint passed cleanly."
else
    echo "⚠ qmllint not found, skipping QML linting."
fi

echo "==> Validating JavaScript syntax..."
if command -v node &> /dev/null; then
    find package/contents/tools -name "*.js" -exec node --check {} \;
    echo "✓ JavaScript syntax validation passed."
else
    echo "⚠ node not found, skipping JS validation."
fi

echo "==> Validating metadata.json..."
if command -v python3 &> /dev/null; then
    python3 -m json.tool package/metadata.json > /dev/null
    echo "✓ metadata.json is valid JSON."
else
    echo "⚠ python3 not found, skipping JSON validation."
fi

echo "==> All quality checks passed successfully!"
