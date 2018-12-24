#
# Cookbook:: lamp2
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


apt_update 'update-package' do
    action :update
end
package 'apache2' do
    action :install
end
service 'apache2' do 
    action :enable
end
service 'restart apache' do
    service_name 'apache2'
    action :restart
end    
package 'php' do
    action :install
end    
package 'libapache2-mod-php' do
    action :install
end   
package 'php-mcrypt' do
    action :install
end    
package 'php-mysql' do
    action :install
end  
package 'php-cli' do
    action :install
end   
file '/var/www/html/info.php' do
     content '<?php phpinfo(); ?>'
     action :create
end

service 'restart apache again' do
    service_name 'apache2'
    action :restart
end    

