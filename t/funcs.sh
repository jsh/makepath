# testfuncs -- base functions for testing

die() { printf "$*\n" >&2; exit 1; }
warn() { printf "$*\n" >&2; }

fail() { die "$0: not ok"; }
success() { warn "$0: ok"; exit 0; }

describe-test() { warn "$0: $*"; }
describe-subtest() { warn "\t- $*"; }
here=$(dirname $(readlink -f $0))

work-in-temp-dir() {
  testdir=/tmp/$$
  rm -rf $testdir; mkdir $testdir; cd $testdir

  trap 'rm -rf $testdir' EXIT;
  trap 'fail' ERR;
}

oneTimeSetUp() {
  source ../makepath
}

setUp() {
  work-in-temp-dir
}
