#
# Cookbook Name:: msg
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/motd" do
source "msg.erb"
mode "0644"
end