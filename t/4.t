#!/bin/bash -eu

source funcs.t
error-logging on
describe-test "Fail when you should fail."
setup

describe-subtest "Fail on a block special file"
! makepath /dev/loop0 
[ -b /dev/loop0 ]
describe-subtest "Fail on a character special file"
! makepath /dev/null
[ -c /dev/null ]
describe-subtest "Fail on a pre-existing File"
touch File
! makepath File
[ -f File ]
describe-subtest "Fail on a pre-existing Fifo"
mkfifo Fifo
! makepath Fifo
[ -p Fifo ]
describe-subtest "Fail if you lack permission"
mkdir Bad
chmod 000 Bad
! makepath Bad/x

success
