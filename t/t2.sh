#!/bin/bash

source funcs.sh
describe-test "sunny-day scenario: act like 'mkdir -p'"

testCreateSubdir() {
  makepath a
  assertTrue 'makepath not a directory' '[ -d a ]'
}

testCreateSubdirWithRelativePath() {
  makepath a/b/c/d
  assertTrue 'no directory a/b/c/d' '[ -d a/b/c/d ]'
}

testCreateSubtreeWithAbsPath() {
  makepath $PWD/$$
  assertTrue "no directory $PWD/$$" '[ -d /$PWD/$$ ]'
}

testCreateSubdirWithEmbeddedBlanks() {
  makepath 'hello world'
  assertTrue 'no directory "hello world"' "[ -d 'hello world' ]"
}

testHandleMultiArgs() {
  makepath a b c d
  assertTrue 'not all directoried {a,b,c,d} created' '[ -d a ] && [ -d b ] && [ -d c ] && [ -d d ]'
}

source shunit2
