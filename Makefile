PROJ = underland

BINDIR = bin
SRCDIR = src
AUXFILES = Makefile README.md

SRCFILES := $(shell find $(SRCDIR) -type f -name "*.c")
HDRFILES := $(shell find $(SRCDIR) -type f -name "*.h")
ALLFILES := $(SRCFILES) $(HDRFILES) $(AUXFILES)

CC=gcc
CCFLAGS=-Wall -Werror -Wextra

$(shell mkdir -p $(BINDIR))

.PHONY: all # Build all executable target
all: $(PROJ)

.PHONY: image # Build Docker development image
image:
	scripts/image.sh $(PROJ)

.PHONY: shell # Run shell into Docker development container
shell:
	scripts/shell.sh $(PROJ)

.PHONY: $(PROJ) # Build Underland executable
$(PROJ):
	$(CC) $(CCFLAGS) -o $(BINDIR)/$@ $(SRCFILES)

.PHONY: clean # Remove all build content
clean:
	-@$(RM) $(BINDIR)/* $(PROJ).tgz

.PHONY: dist # Build tarball for distribution
dist:
	@tar czf $(PROJ).tgz $(ALLFILES)

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
