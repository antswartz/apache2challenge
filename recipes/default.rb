# Cookbook Name:: apache-site
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#


include_recipe 'apt::default'
include_recipe 'apache2::default'

template '/var/www/index.html' do
  source 'index.html.erb'
  mode 0644
  owner 'root'
  group 'root'
end

for p in [ "vim-nox", "curl", "screen", "git", "ruby", "ruby-fog" ] do
  package p do
    action [:install]
  end
end

service 'apache2' do
  action [ :restart ]
end
