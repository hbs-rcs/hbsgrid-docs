# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first three.
export GRID_EXP_ROOTDIR ?= /opt/gridpowered
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = devops_source
BUILDDIR      = devops_docs
MALLARD_FILES=$(wildcard mallard/*.page)
RST_FILES=$(wildcard devops_source/*.rst)

.PHONY: help Makefile fun all clean

all: devops_docs/index.html userguide/html/index.html

clean:
	rm -rf devops_docs/*
	rm -rf userguide/html/*
	rm -f devops_source/available_modules.rst

devops_docs/index.html: $(RST_FILES)
	sphinx-build -M html devops_source devops_docs

userguide/html/index.html: $(MALLARD_FILES)
	yelp-build html -o userguide/html mallard

fun:
	gource --seconds-per-day 1 --user-image-dir devops_source/_static/fun/ -1280x720 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b:v 10000K gource.webm
	mv gource.webm devops_source/_static/fun/gource.webm
	echo "" > devops_source/stats.rst
	echo "Project file statistics" >> devops_source/stats.rst
	echo '"""""""""""""""""""""""' >> devops_source/stats.rst
	echo "" >> devops_source/stats.rst
	cloc --exclude-lang=JavaScript --md .. | pandoc -f markdown -t rst >> devops_source/stats.rst
