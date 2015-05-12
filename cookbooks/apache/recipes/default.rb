#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package "httpd" do 
	action :install
end




 # template "/etc/haproxyhaproxy.cfg" do 
 # source "haproxy.cfg.erb"
 # owner "root"
 # group "root"
 # mode "0644"
 # notifies :restart, "service[haproxy]"
 # end

service "httpd" do 
	supports :restart => true
	action [:enable, :start]
end

node.default["apache"]["indexfile"] = "index2.html"
cookbook_file "/var/www/html/index.html" do
	source node["apache"]["indexfile"]
	mode "0644"
end

service "iptables" do 
	action [:stop, :disable]
end
