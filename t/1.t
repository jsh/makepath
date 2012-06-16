#!/bin/bash -eu

source funcs.t

describe-test "create a shell function named makepath"
source ../makepath

[ "$(type -t makepath)" = "function" ]

success
