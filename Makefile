test:
	$(MAKE) -C t

validate_tests:
	cp makepath.mkdir makepath
	- $(MAKE) -C t
	git reset --hard

.SILENT:
.PHONY: test
