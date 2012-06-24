#!/bin/bash -eu

source funcs.t
setup

describe-test "this is a test"
echo hello world
echo here is an error >&2

describe-subtest "now we test logging"
output-logging on
error-logging on
echo goodbye, dennis
echo here is another error >&2

describe-subtest "now we're done"
