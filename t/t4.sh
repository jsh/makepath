#!/bin/bash

source funcs.sh

describe-test "Fail when you should fail."

failures=fail.OUT
> $failures

testBlockSpecial() {
  dir=/dev/loop0
  assertFalse 'makepath $dir succeeds' 'makepath $dir 2>$failures'
  msg="$(sed 's/^[^:]*: //' $failures)"
  assertEquals 'bad error message' "$msg" "cannot create directory \`$dir': File exists"
  assertTrue '$dir not a block special file' '[ -b $dir ]'
}

testCharacterSpecial() {
  dir=/dev/null
  assertFalse 'makepath $dir succeeds' 'makepath $dir 2>$failures'
  msg="$(sed 's/^[^:]*: //' $failures)"
  assertEquals 'bad error message' "$msg" "cannot create directory \`$dir': File exists"
  assertTrue '$dir not a character special file' '[ -c $dir ]'
}

testFifo() {
  dir=Fifo
  mkfifo Fifo
  assertFalse 'makepath $dir succeeds' 'makepath $dir 2>$failures'
  msg="$(sed 's/^[^:]*: //' $failures)"
  assertEquals 'bad error message' "$msg" "cannot create directory \`$dir': File exists"
  assertTrue '$dir not a fifo' '[ -p $dir ]'
}

testFile() {
  dir=File
  touch File
  assertFalse 'makepath $dir succeeds' 'makepath $dir 2>$failures'
  msg="$(sed 's/^[^:]*: //' $failures)"
  assertEquals 'bad error message' "$msg" "cannot create directory \`$dir': File exists"
  assertTrue '$dir not a File' '[ -f $dir ]'
}

testBadPerms() {
  dir=Bad/Subdir
  mkdir Bad
  chmod 000 Bad
  assertFalse 'makepath $dir succeeds' 'makepath $dir 2>$failures'
  msg="$(sed 's/^[^:]*: //' $failures)"
  assertEquals 'bad error message' "cannot create directory \`$dir': Permission denied" "$msg"
}


source shunit2
