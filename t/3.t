#!/bin/bash -eu

source funcs.t

describe-test "don't make things that are already there"

setup

describe-subtest "root directory [/]"
makepath /
[ -d / ]
describe-subtest "dot [.]"
makepath .
[ -d . ]
describe-subtest "existing subdirectory [a]"
mkdir a
makepath a
[ -d a ]
describe-subtest "existing subdirectory tree [a/b/c/d]"
mkdir -p a/b/c/d
makepath a/b/c/d
[ -d a/b/c/d ]

success
