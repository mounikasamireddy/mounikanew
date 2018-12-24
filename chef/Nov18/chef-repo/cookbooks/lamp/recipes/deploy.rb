#
# Cookbook:: .
# Recipe:: deploy
#
# Copyright:: 2018, The Authors, All Rights Reserved.


file '/var/www/html/info.php' do
    content :'<?php phpinfo(); ?>'
    action :create
end
service 'apache2 restart after deploy' do
    service_name 'apache2'
    action :restart
end


