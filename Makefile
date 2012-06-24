SHELL := /bin/bash
PATH  := /usr/local/bin:/usr/bin:/bin:

test clean:
	$(MAKE) -C t $@

.SILENT:
.PHONY: clean test
