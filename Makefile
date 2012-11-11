# Makefile for the stormforwarder Cookbook.
#
# Source:: https://github.com/ampledata/cookbook-stormforwarder
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0.
#


TMP_TEMPLATE = 'tmp.stormforwarder.XXXXXXXXXX'

GIT_TAG := $(shell git describe --abbrev=0 --tags)
export CB_TMP := $(shell mktemp -d $(TMP_TEMPLATE) --tmpdir=../)

SF_TMP = $(CB_TMP)/stormforwarder


clean:
	rm -rf *.egg* build dist *.pyc *.pyo cover doctest_pypi.cfg nosetests.xml \
		pylint.log *.egg output.xml flake8.log output.xml */*.pyc .coverage core \
		nohup.out stormforwarder*.tar.gz tmp cookbooks t

clean_tmp:
	rm -rf ../tmp.stormforwarder.*

env:
	ruby -e "puts ENV['CB_TMP']"

sync_cookbook: clean
	rsync -a --exclude-from=.tar_exclude . $(SF_TMP)

publish: sync_cookbook
	knife cookbook site share stormforwarder 'Monitoring & Trending' -o $(CB_TMP) -c knife.rb -VV

build_tarball: sync_cookbook
	knife cookbook metadata stormforwarder -o $(CB_TMP) -c knife.rb
	cd $(CB_TMP); tar -zcpf ../cookbook-stormforwarder/stormforwarder-$(GIT_TAG).tar.gz stormforwarder

librarian_chef_update:
	librarian-chef update

vagrant: librarian_chef_update sync_cookbook vagrant_up

vagrant_up:
	vagrant up

vagrant_reload:
	vagrant reload

vagrant_destroy:
	vagrant destroy -f

nuke: vagrant_destroy vagrant
