#!/usr/bin/env ruby
# Installs the stormforwarder Splunk App.
#
# Recipe:: install
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

  remote_directory '/opt/splunkforwarder/etc/apps/stormforwarder/default' do
    user 'splunk'
    group 'splunk'
  end

  remote_directory '/opt/splunkforwarder/etc/apps/stormforwarder/README' do
    user 'splunk'
    group 'splunk'
  end

  template '/opt/splunkforwarder/etc/apps/stormforwarder/default/inputs.conf' do
    user 'splunk'
    group 'splunk'
  end
else
  Chef::Log.error(
    "Node Attributes ['stormforwarder']['api_token'] or " +
    "['stormforwarder']['project_id'] are unset.")
end
