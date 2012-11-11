# Input Configuration Spec for stormforwarder Splunk App.
# Installed via the stormforwarder Chef Cookbook.
#
# File:: default/README/inputs.conf.spec
# Cookbook Name:: stormforwarder
# Source:: https://github.com/ampledata/cookbook-stormforwarder
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0.
#


[default]
_storm_api_token = <string>
 * Your personal private API token

_storm_project_id = <string>
 * Project id to send data to

_tzhint = <string>
 * Timezone hint for parsing timestamps. Se this if you wish to override your project default timezone
