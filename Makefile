format: node_modules .bin/ory  # formats all source code
	npm exec -- prettier --write .
	.bin/ory dev headers license

help:  # prints all make targets
	cat Makefile | grep '^[^ ]*:' | grep -v '^\.bin/' | grep -v '.SILENT:' | grep -v '^node_modules:' | grep -v help | sed 's/:.*#/#/' | column -s "#" -t

.bin/ory: Makefile
	curl https://raw.githubusercontent.com/ory/meta/master/install.sh | bash -s -- -b .bin ory v0.1.41
	touch .bin/ory

node_modules: package-lock.json
	npm install
	touch node_modules


.SILENT:
.DEFAULT_GOAL := help
