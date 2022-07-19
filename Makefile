PROJ=underland

BINDIR=bin
SRCDIR=src
SRCFILES:=$(shell find $(SRCDIR) -type f -name "*.c")
HDRFILES:=$(shell find $(SRCDIR) -type f -name "*.h")

FMT=clang-format
FMTFLAGS=-i
CC=gcc
CCFLAGS=-Wall -Werror -Wextra

$(shell mkdir -p $(BINDIR))

.PHONY: all # Build all executable target
all: build

.PHONY: image # Build Docker development image
image:
	scripts/image.sh $(PROJ)

.PHONY: shell # Run shell into Docker development container
shell:
	scripts/shell.sh $(PROJ)

.PHONY: format # Run ClangFormat on C files
format:
	$(FMT) $(FMTFLAGS) $(SRCFILES) $(HDRFILES)

.PHONY: build # Build Underland executable
build:
	$(CC) $(CCFLAGS) -o $(BINDIR)/$(PROJ) $(SRCFILES)

.PHONY: clean # Remove all build content
clean:
	-@$(RM) $(BINDIR)/* $(PROJ).tgz

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
