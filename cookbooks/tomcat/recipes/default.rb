#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
###updating libraries###
execute "yum update" do
  command "yum update"
  ignore_failure true
end
 
 ###installing nginx###
package 'nginx' do
        action :install
end
 
 ###installing tomcat7###
package 'tomcat7' do
        action :install
end
 
###replacing nginx default vhost file by vhost file in our cookbook files/default directory###
cookbook_file "/etc/nginx/sites-enabled/default" do
  source "default"
  mode "0644"
  notifies :restart, "service[nginx]"
end
 
###Clearing tomcat7 webapps ROOT folder###
bash 'Clearing tomcat7 webapps ROOT folder' do
  user 'root'
  cwd '/home/ec2-user'
  code <<-EOH
  sudo rm -rf /var/lib/tomcat7/webapps/ROOT
  EOH
end
 
###copying and replacing existing ROOT.war with new ROOT.war in our cookbook files/default directory###
cookbook_file "/var/lib/tomcat7/webapps/ROOT.war" do
  source "ROOT.war"
  mode "0644"
  notifies :restart, "service[nginx]"
  notifies :restart, "service[tomcat7]"
end
 
###restarting tomcat7 service###
service 'tomcat7' do
  supports :restart => true
end
 
###restarting nginx web server###
service 'nginx' do
  supports :restart => true
  supports :reload =>true
end
