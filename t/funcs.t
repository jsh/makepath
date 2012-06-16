# testfuncs -- base functions for testing

die() { printf "$*\n" >&2; exit 1; }
warn() { printf "$*\n" >&2; }
work-in-temp-dir() {
  here=$(dirname $(readlink -f $0))
  testdir=/tmp/$$
  rm -rf $testdir; mkdir $testdir; cd $testdir

  trap 'rm -rf $testdir' EXIT;
  trap 'fail' ERR;
}

setup() {
  source ../makepath
  work-in-temp-dir
}

fail() { die "$0: FAIL"; }
success() { warn "$0: ok"; exit 0; }
describe-test() { warn "$0: $*"; }
describe-subtest() { warn "\t- $*"; }
