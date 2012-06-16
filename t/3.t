#!/bin/bash -eu

die() { echo "$*" >&2; exit 1; }
warn() { echo "$*" >&2; }
work-in-temp-dir() {
  testdir=/tmp/$$
  rm -rf $testdir; mkdir $testdir; cd $testdir

  trap 'rm -rf $testdir' EXIT;
  trap 'die $0: FAIL' ERR;
}

setup() {
  source ../makepath
  work-in-temp-dir
}

warn "$0: don't make things that are already there"

setup

warn "$0: makepath /"
[ -d / ]
warn "$0: existing directory"
mkdir a
makepath a
[ -d a ]
warn "$0: existing subdirectory tree"
mkdir -p a/b/c/d
makepath a/b/c/d
[ -d a/b/c/d ]

warn "$0: ok"
