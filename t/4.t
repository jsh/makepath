#!/bin/bash -eu

source funcs.t

describe-test "Fail when you should fail."

setup

failures=Failures.OUT
> $failures
describe-subtest "Fail on a pre-existing File"
touch File
! makepath File 2>> $failures
[ -f File ]
describe-subtest "Fail on a pre-existing Fifo"
mkfifo Fifo
! makepath Fifo 2>> $failures
[ -p Fifo ]
describe-subtest "Fail on a special file"
! makepath /dev/null 2>> $failures
[ -c /dev/null ]
describe-subtest "Fail if you lack permission"
mkdir Bad
chmod 000 Bad
! makepath Bad/x 2>> $failures
sed -i 's/[^:]*: //' $failures

if ! diff $here/${0/.t/.bmk} $failures; then
  mv $failures $here/${0/.t/.FAIL}
  fail
fi

success
