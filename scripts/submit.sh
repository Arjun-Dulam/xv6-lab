#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
cd "${SCRIPT_DIR}/.."
ROOT_DIR="$(pwd)"
OUT="$ROOT_DIR/submission.zip"
BASE_COMMIT="d2f1e60a03129dff8a9ef07add9f988e6da759c0"
COMMIT_TARGET="commits.txt"
DIR_TARGETS=('bootblock' 'include' 'kernel' 'tools' 'user')
FILE_TARGETS=('CMakeLists.txt' $COMMIT_TARGET)

git log "$BASE_COMMIT..HEAD" > $COMMIT_TARGET
zip -r "$OUT" ${DIR_TARGETS[@]} ${FILE_TARGETS[@]}
rm $COMMIT_TARGET
