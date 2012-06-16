#!/bin/bash -eu

source funcs.t

describe-test "sunny-day scenario: act like 'mkdir -p'"

setup

describe-subtest "create a subdirectory [a]"
makepath a
[ -d a ]

describe-subtest "create a subtree with a relative path [a/b/c/d]"
makepath a/b/c/d
[ -d a/b/c/d ]

describe-subtest "create a subtree with an absolute path [$PWD/$$]"
makepath $PWD/$$
[ -d /$PWD/$$ ]

describe-subtest "create directories with embedded blanks [hello world]"
makepath 'hello world'
[ -d 'hello world' ]

success
