PROJ=underland

.PHONY: image # Build Docker development image
image:
	scripts/image.sh $(PROJ)

.PHONY: shell # Run shell into Docker development container
shell:
	scripts/shell.sh $(PROJ)

.PHONY: build # Build Underland executable
build:
	scripts/build.sh

.PHONY: clean # Remove all build content
clean:
	rm -rf bin

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
