#!/bin/bash

source funcs.sh

describe-test "don't make things that are already there"

testMakeRootDir() {
  makepath /
  assertTrue '/ no longer a directory' '[ -d / ]'
}

testMakeDot() {
  makepath .
  assertTrue 'dot (.) no longer a directory' '[ -d . ]'
}

testMakeExistingDir() {
  mkdir a
  makepath a
  assertTrue 'makepath does not delete directory' '[ -d a ]'
}

testMakeExistingSubdirTree() {
  mkdir -p a/b/c/d
  makepath a/b/c/d
  assertTrue 'makepath does not delete directory path' '[ -d a/b/c/d ]'
}

source shunit2
