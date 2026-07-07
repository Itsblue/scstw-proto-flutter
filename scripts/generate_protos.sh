#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

PROTO_DIR="${PROTO_DIR:-"$ROOT_DIR/lib/proto"}"
OUT_DIR="${OUT_DIR:-"$ROOT_DIR/lib/proto_out"}"

export PATH="$PATH:$HOME/.pub-cache/bin"

if ! command -v protoc >/dev/null 2>&1; then
  echo "error: protoc is not installed or not in PATH" >&2
  echo "Install it with your system package manager, for example: brew install protobuf" >&2
  exit 1
fi

if ! command -v protoc-gen-dart >/dev/null 2>&1; then
  echo "error: protoc-gen-dart is not installed or not in PATH" >&2
  echo "Install it with: dart pub global activate protoc_plugin" >&2
  exit 1
fi

if [ ! -d "$PROTO_DIR" ]; then
  echo "error: proto directory does not exist: $PROTO_DIR" >&2
  exit 1
fi

PROTO_FILES=()
while IFS= read -r proto_file; do
  PROTO_FILES+=("$proto_file")
done < <(find "$PROTO_DIR" -name '*.proto' -type f | sort)

if [ "${#PROTO_FILES[@]}" -eq 0 ]; then
  echo "error: no .proto files found in $PROTO_DIR" >&2
  exit 1
fi

TMP_OUT="$(mktemp -d "${TMPDIR:-/tmp}/scstw_proto_out.XXXXXX")"
PROTOC_LOG="$(mktemp "${TMPDIR:-/tmp}/scstw_protoc.XXXXXX.log")"
trap 'rm -rf "$TMP_OUT" "$PROTOC_LOG"' EXIT

if ! protoc \
  --proto_path="$PROTO_DIR" \
  --dart_out="$TMP_OUT" \
  "${PROTO_FILES[@]}" >"$PROTOC_LOG" 2>&1; then
  if grep -q "Invalid kernel binary format" "$PROTOC_LOG"; then
    echo "error: protoc-gen-dart is installed with a stale Dart snapshot" >&2
    echo "Reinstall it with: dart pub global activate protoc_plugin" >&2
  else
    cat "$PROTOC_LOG" >&2
  fi
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"
cp -R "$TMP_OUT"/. "$OUT_DIR"/

echo "Generated Dart protobuf files in $OUT_DIR"
