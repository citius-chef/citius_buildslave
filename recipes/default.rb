#
# Cookbook:: citius_buildslave
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#include_recipe 'sudo'
include_recipe 'java'
include_recipe 'git'
include_recipe 'citius_jenkins::install_slave'
tag('slave')
ruby_block 'set `slave_labels` node attributes to build-server' do
  block do
    node.normal['slave_labels'] = 'build-server'
    node.save
  end
end