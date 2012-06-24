# testfuncs -- base functions for testing

# cached copies of stdout & stderr
exec 8>&1
exec 9>&2

warn() { printf "$*\n" >&9; }
die() { printf "$*\n" >&9; exit 1; }

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

# logging

error-logging() {
  if [ "$1" = "off" ]; then
    exec 2>&9
  else
    exec 2>>${_logfile:=log}
  fi
}

output-logging() {
  if [ "$1" = "off" ]; then
    exec >&8
  else
    exec >>${_logfile:=log}
  fi
}

