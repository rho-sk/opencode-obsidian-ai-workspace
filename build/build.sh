#!/bin/bash
set -e

VERSION=${1:?"Usage: build.sh <version>"}
PROJECT="opencode-obsidian-ai-workspace"
RELEASE_NAME="${PROJECT}.v${VERSION}"
DIST_DIR="dist"
ZIP_FILE="${RELEASE_NAME}.zip"

echo "Building ${ZIP_FILE}..."

# Clean dist
rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}/${RELEASE_NAME}/manual"

# Copy system/ and templates/ to ZIP root
cp -r system "${DIST_DIR}/"
cp -r templates "${DIST_DIR}/"

# Copy manual/ into versioned subdirectory
cp -r manual/sk "${DIST_DIR}/${RELEASE_NAME}/manual/"
cp -r manual/en "${DIST_DIR}/${RELEASE_NAME}/manual/"

# Copy README into versioned subdirectory
cp README.md "${DIST_DIR}/${RELEASE_NAME}/"

# Create ZIP
cd "${DIST_DIR}"
zip -r "../${ZIP_FILE}" .
cd ..

echo "Done: ${ZIP_FILE}"
