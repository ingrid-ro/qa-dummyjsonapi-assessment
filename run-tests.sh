#!/usr/bin/env bash
set -euo pipefail

# Run the DummyJSON Postman collection via Newman and produce an HTML report.
# Output: docs/screenshots/report.html (overwritten on every run)
#
# Dependencies (install once):
#   npm install -g newman newman-reporter-htmlextra

COLLECTION="collections/dummyjson.postman_collection.json"
REPORT="docs/screenshots/report.html"

# Always run from the project root regardless of where the script is called from
cd "$(dirname "$0")"

# Check Newman is available
if ! command -v newman &>/dev/null; then
  echo "Error: newman is not installed."
  echo "Run: npm install -g newman newman-reporter-htmlextra"
  exit 1
fi

# Check the htmlextra reporter is available
if ! npm list -g newman-reporter-htmlextra --depth=0 &>/dev/null; then
  echo "Error: newman-reporter-htmlextra is not installed."
  echo "Run: npm install -g newman-reporter-htmlextra"
  exit 1
fi

echo "Running DummyJSON API test collection..."
echo ""

newman run "$COLLECTION" \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export "$REPORT" \
  --reporter-htmlextra-title "DummyJSON API — Test Results"

echo ""
echo "HTML report saved → $REPORT"
