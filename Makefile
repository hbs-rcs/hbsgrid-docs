# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first three.
SOURCEDIR     = .
BUILDDIR      = .
MALLARD_FILES=$(wildcard source/*.page)

.PHONY: all

all: index.html

index.html: $(MALLARD_FILES)
	yelp-build html -o . source
