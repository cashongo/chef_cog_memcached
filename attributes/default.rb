#
# Cookbook Name:: cog_memcached
# Attributes:: default
#
# Copyright 2009-2013, Opscode, Inc.
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

default['cog_memcached']['memory'] 			= 64
default['cog_memcached']['port'] 			= 11211
default['cog_memcached']['udp_port'] 		= 11211
default['cog_memcached']['listen'] 			= '0.0.0.0'
default['cog_memcached']['maxconn'] 		= 1024
default['cog_memcached']['max_object_size'] = '1m'
default['cog_memcached']['logfilename'] 	= 'memcached.log'

case node['platform_family']
when 'suse', 'fedora', 'rhel'
  default['cog_memcached']['user'] = 'memcached'
  default['cog_memcached']['group'] = 'memcached'
when 'ubuntu'
  default['cog_memcached']['user'] = 'memcache'
  default['cog_memcached']['group'] = 'memcache'
when 'debian'
  default['cog_memcached']['user'] = 'nobody'
  default['cog_memcached']['group'] = 'nogroup'
else
  default['cog_memcached']['user'] = 'nobody'
  default['cog_memcached']['user'] = 'nogroup'
end
