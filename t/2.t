#!/bin/bash -eu

die() { echo "$*" >&2; exit 1; }
warn() { echo "$*" >&2; }
work-in-temp-dir() {
  testdir=/tmp/$$
  rm -rf $testdir; mkdir $testdir; cd $testdir

  trap 'rm -rf $testdir' EXIT;
}

setup() {
  source ../makepath
  work-in-temp-dir
}

warn "$0: sunny-day scenario: act like 'mkdir -p a/b/c/d'"

setup
makepath a/b/c/d
[ -d a/b/c/d ] || die "$0: FAIL"

warn "$0: ok"
