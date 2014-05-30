#
# Cookbook Name:: cog_memcached
# Definition:: memcached_instance
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

define :memcached_instance do
  include_recipe 'runit'
  include_recipe 'cog_memcached'

  opts = params

  runit_service "memcached-#{params[:name]}" do
    run_template_name 'memcached'
    default_logger    true
    cookbook          'cog_memcached'
    options({
      :memory   => node['cog_memcached']['memory'],
      :port     => node['cog_memcached']['port'],
      :udp_port => node['cog_memcached']['udp_port'],
      :listen   => node['cog_memcached']['listen'],
      :maxconn  => node['cog_memcached']['maxconn'],
      :user     => node['cog_memcached']['user']
    }.merge(opts))
  end
end
