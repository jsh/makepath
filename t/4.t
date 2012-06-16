#!/bin/bash -eu

die() { echo "$*" >&2; exit 1; }
warn() { echo "$*" >&2; }
work-in-temp-dir() {
  here=$(dirname $(readlink -f $0))
  testdir=/tmp/$$
  rm -rf $testdir; mkdir $testdir; cd $testdir

  trap 'rm -rf $testdir' EXIT;
  trap 'die $0: FAIL' ERR;
}

setup() {
  source ../makepath
  work-in-temp-dir
}

warn "$0: Fail when you should fail."

setup

failures=Failures.OUT
> $failures
warn "$0: Fail on a pre-existing File"
touch File
! makepath File 2>> $failures
[ -f File ]
warn "$0: Fail on a pre-existing Fifo"
mkfifo Fifo
! makepath Fifo 2>> $failures
[ -p Fifo ]
warn "$0: Fail on a special file"
! makepath /dev/null 2>> $failures
[ -c /dev/null ]
warn "$0: Fail if you lack permission"
mkdir Bad
chmod 000 Bad
! makepath Bad/x 2>> $failures

diff $here/${0/.t/.bmk} $failures
warn "$0: ok"
