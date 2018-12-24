#
# Cookbook:: lamp
# Recipe:: .php
#
# Copyright:: 2018, The Authors, All Rights Reserved.


package 'php' do
    action :install
end
package 'libapache2-mod-php' do
    action :install
end
package 'php-mcrypt' do
    action :install
end

package 'php-cli' do
    action :install
end
service 'apache2 restart after installing php packages' do
    service_name 'apache2'
    action :restart
end
