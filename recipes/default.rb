#
# Cookbook:: citius_buildslave
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#include_recipe 'sudo'
include_recipe 'java'
include_recipe 'git'
include_recipe 'citius_jenkins::install_slave'

if node['platform'] == 'rhel' || node['platform'] == 'redhat' || node['platform'] == 'centos'
  cron 'schedule_chef_client' do  
    minute '30'
    command 'chef-client'
  end
end

tag('slave')
ruby_block 'set `slave_labels` node attributes to build-server' do
  block do
    node.normal['slave_labels'] = 'build-server'
    node.save
  end
end