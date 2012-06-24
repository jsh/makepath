# testfuncs -- base functions for testing

# generics
die() { printf "$*\n" >&2; exit 1; }
warn() { printf "$*\n" >&2; }

# report failures, successes
fail() { die "$0: not ok"; }
success() { warn "$0: ok"; exit 0; }

# generic descriptions
describe-test() { warn "$0: $*"; }
describe-subtest() { warn "\t- $*"; }

# do all work in temporariy directory
work-in-temp-dir() {
  here=$(dirname $(readlink -f $0))
  _testdir=/tmp/$$
  rm -rf $_testdir; mkdir $_testdir; cd $_testdir

  trap 'rm -rf $_testdir' EXIT;
  trap 'fail' ERR;
}

# the function to call at the beginning of testing
setup() {
  source ../makepath
  work-in-temp-dir
}
