# Makefile --- A simple Makefile for working on specs.

# This Makefile assumes you have a local install of bikeshed. Like any
# other Python tool, you install it with pip:
#
#     pip3 install bikeshed && bikeshed update

# It also assumes you have doctoc installed. This is a tool that
# automatically generates Table of Contents for Markdown files. It can
# be installed like any other NPM module:
#
#    npm install -g doctoc

.PHONY: all clean update-explainer-toc
.SUFFIXES: .bs .html

all: update-explainer-toc index.html

clean:
	rm -f index.html *~

index.html: private-click-measurement.bs Makefile
	bikeshed spec $< $@

update-explainer-toc: README.md Makefile
	doctoc $< --title "## Table of Contents" > /dev/null
