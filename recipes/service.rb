#
# Cookbook Name:: collectd
# Recipe:: service
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

if node[:platform_family] == "mac_os_x"
  cookbook_file "/System/Library/LaunchDaemons/homebrew.mxcl.collectd.plist" do
    source "service/homebrew.mxcl.collectd.plist"
    owner "root"
    group "wheel"
    mode 00644
  end
end

service "collectd" do
  service_name node[:collectd][:svc_name]
  supports :restart => true, :status => true
  action [:enable, :start]
end
