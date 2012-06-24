SHELL := /bin/bash
PATH  := /usr/local/bin:/usr/bin:/bin:

clean test:
	$(MAKE) -C t $@

.SILENT:
.PHONY: clean test
