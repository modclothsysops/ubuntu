#
# Cookbook Name:: ubuntu
# Recipe:: default
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "users"

users_manage "root" do
  group_id 0
  action :create
end

service 'ntp' do
  supports [ :enable, :disable, :restart ]
  action [ :enable ]
end

cookbook_file '/etc/ntp.conf' do
  source 'ntp.conf'
  notifies :restart, resources(:service => 'ntp'), :immediately
end

service 'apache2' do
  supports [ :start, :stop, :restart ]
  action [ :stop ]
end

cookbook_file '/root/.profile' do
  source 'dot_profile'
end

cookbook_file '/root/.bashrc' do
  source 'dot_bashrc'
end

cookbook_file '/root/.bash_profile' do
  source 'dot_bash_profile'
end

