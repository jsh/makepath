#!/bin/bash -eu


die() { echo "$*" >&2; exit 1; }
warn() { echo "$*" >&2; }

warn "$0: create a shell function named makepath"
source ../makepath

[ "$(type -t makepath)" = "function" ] || die "$0: FAIL"

echo "$0: ok"
