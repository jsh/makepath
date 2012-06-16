#!/bin/bash -eu

source funcs.t

describe-test "Cases where a difference with 'mkdir -p' may be okay."

setup

failures=/tmp/Failures.OUT
> $failures

describe-subtest "Fail if you lack permission"
mkdir Bad
chmod 000 Bad
! makepath Bad/x 2>> $failures

describe-subtest "Fail unless the error messages are accurate"
sed -i 's/[^:]*: //' $failures
if ! diff $here/${0/.t/.bmk} $failures; then
  mv $failures $here/${0/.t/.FAIL}
  warn "
    Actual error messages in ${0/.t/.FAIL}
    Expected messages in ${0/.t/.bmk}
  "
fi
