#
# Cookbook:: lamp
# Recipe:: .apache
#
# Copyright:: 2018, The Authors, All Rights Reserved.



apt_update 'update packages' do
    action :update
end
package 'apache2' do
    action :install
end
service 'apache2 enabled' do
    service_name 'apache2'
    action :enable
end
service 'apache2' do
    action :restart
end



