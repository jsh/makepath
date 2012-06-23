#! /bin/bash
# file: examples/equality_test.sh

source funcs.sh
describe-test "this is a test"

test_Hello()
{
  assertTrue 'this is a test' 'true'
}

# load shunit2
source shunit2
