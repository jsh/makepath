#!/bin/bash -eu

source funcs.t

describe-test "Cases where a difference with 'mkdir -p' may be okay."

setup

failures=/tmp/Failures.OUT
> $failures


#describe-subtest "Fail unless the error messages are accurate"
#sed -i 's/[^:]*: //' logfile
#if ! diff $here/${0/.t/.bmk} logfile; then
#  mv $failures $here/${0/.t/.FAIL}
#  fail
#fi

describe-subtest "Report differences with 'mkdir -p'"
sed -i 's/[^:]*: //' $failures
if ! diff $here/${0/.t/.bmk} $failures; then
  mv $failures $here/${0/.t/.FAIL}
  warn "
    Actual error messages in ${0/.t/.FAIL}
    Expected messages in ${0/.t/.bmk}
  "
fi

success
