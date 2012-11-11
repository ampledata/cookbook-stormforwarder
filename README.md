Description
===========
Cookbook for setting up a splunkforwarder as a Splunk Storm forwarder.

[![Build Status](https://secure.travis-ci.org/ampledata/cookbook-stormforwarder.png?branch=master)](http://travis-ci.org/ampledata/cookbook-stormforwarder)


Requirements
============
1. Linux host on which to run splunkforwarder.
2. The [splunkforwarder Cookbook](http://community.opscode.com/cookbooks/splunkforwarder)
3. The Splunk Storm Access Token: Login to Splunk Storm and Navigate to [Account Overview](https://www.splunkstorm.com/storm/account/overview) and click **Show Authentication Token.**
4. The Splunk Storm Project ID: Login to Splunk Storm and Navigate to your project's *<Settings>*, where you'll find your Project ID.



Attributes
==========
This Cookbook uses the following Attributes to configure the
stormforwarder app within the splunkforwarder installation.

Required Attributes
-------------------
The following Attributes MUST be set before this Cookbook can configure
the splunkforwarder to forward to Splunk Storm:


* `node['stormforwarder']['project_id']` - Storm Project ID.
* `node['stormforwarder']['api_token']` - Splunk Storm API Token.

These Attributes have no default value and must be set, preferably using
an Environment or Role. See [Attributes](
http://wiki.opscode.com/display/chef/Attributes) for more information
using Environments & Roles to set Node Attributes.


Usage
=====

1. Set the Required Attributes using a Environment, Role, etc..
2. Add the 'splunkforwarder' Cookbook to a Node's Run List.
3. Add this Cookbook to a Node's Run List.


Source
======
https://github.com/ampledata/cookbook-stormforwarder

Author
======
Author:: Greg Albrecht (mailto:gba@splunk.com)

Credits
=======
The stormforwarder Cookbook is inspired by the splunkstorm Cookbook
written by Aaron Wallis of Lexer.

Copyright
=========
* Copyright 2012 Splunk, Inc.

License
=======
Apache License 2.0. See LICENSE.txt
