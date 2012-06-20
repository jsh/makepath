SHELL := /bin/bash
PATH  := /usr/local/bin:/usr/bin:/bin

test:
	$(MAKE) -C t

.SILENT:
.PHONY: test
