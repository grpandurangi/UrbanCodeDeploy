#
# Cookbook Name:: ucd_agent
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#package 'java' do
# action :install
#end 

template "/tmp/installed.properties" do
 source "installed.properties.erb"
 variables ({
  :ucd_server_ip => '13.78.48.145'
 })
end

cookbook_file "/tmp/auto_install_ucd_agent.sh" do
  source "auto_install_ucd_agent.sh"
  mode 0755
end

execute "install UCD agent" do
  command "bash /tmp/auto_install_ucd_agent.sh"
end
