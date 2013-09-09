#
# Cookbook Name:: shopkeep
#
# Copyright 2013, Shopkeep POS, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

use_inline_resources

def load_current_resource
	@source = new_resource.source
	@sourcetype = new_resource.sourcetype
	@index = new_resource.index
	@host = new_resource.host
	@host_regex = new_resource.host_regex
	@host_segment = new_resource.host_segment
	@rename = new_resource.rename
	@follow_only = new_resource.follow_only
end

action :add do
	monitor_exists(@source) ? update_monitor(@source) : add_monitor(@source)
end

action :remove do
	if monitor_exists(@source)
		remove_monitor(@source)
	end
end

def params
	parms = { :sourcetype => @sourcetype, :index => @index, :host => @host, :host_regex => @host_regex, :host_segment => @host_segment, :rename => @rename, :follow_only => @follow_only }.reject!{|k, v| v.nil?}
	parms.map {|k, v| "-#{k} #{v}" }.join(" ")
end

def monitor_exists(source)
	exec( "/opt/splunkforwarder/bin/splunk list monitor -auth admin:changeme | sed -e 's/^[ \t]*//' | grep '^#{source}$'" )
end

def add_monitor(source)
	if monitor_exists(source)
		exec( "/opt/splunkforwarder/bin/splunk add monitor -auth admin:changeme -source #{source} #{params}" )
	else
		update_monitor(source)
	end
end

def update_monitor(source)
	if monitor_exists(source)
		exec( "/opt/splunkforwarder/bin/splunk edit monitor -auth admin:changeme -source #{source} #{params}" )
	else
		add_monitor(source)
	end
end

def remove_monitor(source)
	if monitor_exists(source)
		exec ( "/opt/splunkforwarder/bin/splunk remove monitor -auth admin:changeme -source #{source}" )
	end
end