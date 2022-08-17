format: .bin/ory  # formats all source code
	npm run format
	.bin/ory dev headers license

help:  # prints all make targets
	cat Makefile | grep '^[^ ]*:' | grep -v '.PHONY' | grep -v '.SILENT' | grep '#' | sed 's/:.*#/#/' | column -s "#" -t

.bin/ory: Makefile
	curl https://raw.githubusercontent.com/ory/meta/master/install.sh | bash -s -- -b .bin ory v0.1.36
	touch .bin/ory


.SILENT:
.DEFAULT_GOAL := help
