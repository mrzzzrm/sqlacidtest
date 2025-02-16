#!/bin/bash

USAGE=`cat <<END
stich.sh -- The SQL ACID test stiching tool.

Usage: stich.sh [OPTIONS] <test>...

Arguments:
  <test>...
          The tests to stich together. These should be SQL files that adhere to
          the following format

              [TODO]

Options:
  \033[1m-h, --help
          Print this and exit.
END`

usage() { printf "$USAGE\n"; exit 1; }

ABORT='/!\ %s'

abort() { printf "$ABORT\n" "$1" >&2; usage; }

PROJECT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RENDER_TEMPLATE_FILE="$PROJECT_DIR/sql/renderer.sql"

TEST_FILES=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      ;;
    -*|--*)
      abort "Unknown option: $1"
      ;;
    *)
      TEST_FILES+=("$1")
      shift
      ;;
  esac
done

N_TESTS="${#TEST_FILES[@]}"
if [[ $N_TESTS -ge 260 ]]; then
  abort "too many test cases (max 260 allowed)"
fi

function uglify() {
  sed -E 's/--.*//' "${1:-/dev/stdin}" | tr '\n' ' '
}

RENDER_TEMPLATE="$(< $RENDER_TEMPLATE_FILE)"
RENDER_TEMPLATE_HEAD="${RENDER_TEMPLATE%-- START TEST CASES*}"
RENDER_TEMPLATE_TAIL="${RENDER_TEMPLATE#*-- END TEST CASES}"

echo "$RENDER_TEMPLATE_HEAD"

for TEST_FILE in "${TEST_FILES[@]}"; do
  printf '%s\nUNION ALL\n' "$(< "$TEST_FILE")"
done

printf "select index as test, true as result from generate_series($((1+N_TESTS)),260) s(index) "

echo "$RENDER_TEMPLATE_TAIL"

echo
