version '1.0.0'

description 'Configures a splunkforwarder to forward to Splunk Storm.'

maintainer 'Greg Albrecht'
maintainer_email 'gba@splunk.com'
license 'Apache License 2.0'


depends 'splunkforwarder'


%w{redhat centos fedora debian suse ubuntu}.each do |os|
  supports os
end


long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
