
tests := $(wildcard *.t)
out   := $(tests:%=out/%)

test: $(out)

out/%: ../makepath %
	[ -d out ] || mkdir out
	[ ! -x $* ] || ./$* > $@

clean:
	rm -rf out logfile

.SILENT:
.PHONY: clean test
