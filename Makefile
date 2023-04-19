
SHELL = /bin/bash

PROJECTNAME = "[test_openssl_lib_api_barebones]"

.PHONY: all
all:
	./go.sh
	@echo "*** $(PROJECTNAME) $@ Done"

