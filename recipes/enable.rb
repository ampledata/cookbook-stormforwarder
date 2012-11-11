#!/usr/bin/env ruby
# Enables the stormforwarder Splunk App.
#
# Recipe:: enable
# Cookbook Name:: stormforwarder
# Source:: https://github.com/ampledata/cookbook-stormforwarder
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0.
#


include_recipe 'splunkforwarder'


if node.attribute?('stormforwarder') and
    node['stormforwarder'].attribute?('api_token') and
    node['stormforwarder'].attribute?('project_id')

  # TODO(gba) Can I reload the app collection w/o restart?
  execute '/opt/splunkforwarder/bin/splunk restart'

  execute '/opt/splunkforwarder/bin/splunk enable app stormforwarder -auth ' +
    'admin:changeme'
else
  Chef::Log.error(
    "Node Attributes ['stormforwarder']['api_token'] or " +
    "['stormforwarder']['project_id'] are unset.")
end
