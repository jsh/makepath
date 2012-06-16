#!/bin/bash -eu

die() { echo "$*" >&2; exit 1; }
warn() { echo "$*" >&2; }
setup() {
  testdir=/tmp/$$
  rm -rf $testdir
  trap 'rm -rf $testdir' EXIT;
  source ../makepath
}

warn "$0: sunny-day scenario: act like 'mkdir -p a/b/c/d'"

setup
makepath a/b/c/d
[ -d a/b/c/d ] || die "$0: FAIL"

warn "$0: ok"
