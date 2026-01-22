#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Dependency checks
# ----------------------------

err() {
  echo "ERROR: $*" >&2
  exit 1
}

# Check curl
if ! command -v curl >/dev/null 2>&1; then
  err "curl is not installed. Please install curl and retry."
fi

# Check gpg and version >= 2.0
if ! command -v gpg >/dev/null 2>&1; then
  err "gpg is not installed. Please install GnuPG (v2.0 or newer) and retry."
fi

GPG_VERSION="$(gpg --version | head -n1 | awk '{print $3}')"

version_ge() {
  # returns 0 if $1 >= $2
  printf '%s\n%s\n' "$2" "$1" | sort -C -V
}

if ! version_ge "$GPG_VERSION" "2.0"; then
  err "gpg version ${GPG_VERSION} found, but version 2.0 or newer is required."
fi

# ----------------------------
# Platform detection
# ----------------------------

ARCH="$(
  case "$(uname -m)" in
    x86_64)  echo -n amd64 ;;
    aarch64) echo -n arm64 ;;
    *)       uname -m ;;
  esac
)"
export ARCH

OS="$(uname | awk '{print tolower($0)}')"
export OS

# ----------------------------
# Download and install operator-sdk
# ----------------------------

OPERATOR_SDK_VERSION="v1.42.0"
OPERATOR_SDK_DL_URL="https://github.com/operator-framework/operator-sdk/releases/download/${OPERATOR_SDK_VERSION}"

BINARY="operator-sdk_${OS}_${ARCH}"

echo "Downloading operator-sdk ${OPERATOR_SDK_VERSION} for ${OS}/${ARCH}..."
curl -fL -o "${BINARY}" "${OPERATOR_SDK_DL_URL}/${BINARY}"

chmod +x "${BINARY}"
sudo mv "${BINARY}" /usr/local/bin/operator-sdk

echo "operator-sdk installed successfully:"
operator-sdk version

