#!/usr/bin/env ruby
# Installs & enables the stormforwarder Splunk App.
#
# Recipe:: default
# Cookbook Name:: stormforwarder
# Source:: https://github.com/ampledata/cookbook-stormforwarder
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0.
#


include_recipe 'stormforwarder::install'
include_recipe 'stormforwarder::enable'
