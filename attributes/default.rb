#
# Cookbook Name:: collectd
# Attributes:: default
#
# Copyright 2010, Atari, Inc
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

default[:collectd][:interval] = 10
default[:collectd][:read_threads] = 5

case node[:platform_family]
when "mac_os_x"
  default[:collectd][:base_dir] = "/usr/local/var/lib/collectd"
  default[:collectd][:cfg_dir] = "/usr/local/etc/collectd"
  default[:collectd][:cfg_group] = "wheel"
  default[:collectd][:plugin_dir] = "/usr/local/lib/collectd"
  default[:collectd][:types_db] = ["/usr/local/share/collectd/types.db"]
  default[:collectd][:pkg_name] = "collectd"
  default[:collectd][:svc_name] = "homebrew.mxcl.collectd"
else
  default[:collectd][:base_dir] = "/var/lib/collectd"
  default[:collectd][:cfg_dir] = "/etc/collectd"
  default[:collectd][:cfg_group] = "root"
  default[:collectd][:plugin_dir] = "/usr/lib/collectd"
  default[:collectd][:types_db] = ["/usr/share/collectd/types.db"]
  default[:collectd][:pkg_name] = "collectd-core"
  default[:collectd][:svc_name] = "collectd"
end

default[:collectd][:collectd_web][:path] = "/srv/collectd_web"
default[:collectd][:collectd_web][:hostname] = "collectd"
