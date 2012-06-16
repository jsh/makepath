#!/bin/bash -eu

source funcs.t

describe-test "sunny-day scenario: act like 'mkdir -p a/b/c/d'"

setup
makepath a/b/c/d
[ -d a/b/c/d ]

success
