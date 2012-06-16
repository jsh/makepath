#!/bin/bash -eu

source funcs.t

describe-test "don't make things that are already there"

setup

describe-subtest "makepath /"
[ -d / ]
describe-subtest "existing directory"
mkdir a
makepath a
[ -d a ]
describe-subtest "existing subdirectory tree"
mkdir -p a/b/c/d
makepath a/b/c/d
[ -d a/b/c/d ]

success
