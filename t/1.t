#!/bin/bash -eu
# create a shell function named makepath

die() { echo "$*"; exit 1; }

source ../makepath

[ "$(type -t makepath)" = "function" ] || die "$0: FAIL"

echo "$0: ok"
