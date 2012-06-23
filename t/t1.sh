#!/bin/bash -eu

source funcs.sh

describe-test "create a shell function named makepath"

testFunctionExists() {
  makepath_type=$(type -t makepath)
  assertEquals 'makepath not a function' "$makepath_type"  "function"
}

source shunit2
