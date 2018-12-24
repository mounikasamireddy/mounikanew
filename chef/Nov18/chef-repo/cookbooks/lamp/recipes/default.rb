#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


include_recipe 'lamp::apache'
include_recipe 'lamp::deploy'
include_recipe 'lamp::php'

