#! /bin/bash
CHANGELOG_VERSION=$(git-cliff --bumped-version | cut -d'-' -f1)
CHANGELOG_PATH="CHANGELOG.md"
git-cliff --verbose --tag "${CHANGELOG_VERSION}" --unreleased --prepend "${CHANGELOG_PATH}"