#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright 2012, University of Chicago
#

execute "Install Java" do
  case node[:platform]
  when "debian","ubuntu"
    command <<-EOH
    apt-get update
    apt-get -y install default-jre-headless
    EOH
  end
end

remote_file "/home/#{node[:logstash][:username]}/logstash-1.1.1-monolithic.jar" do
  source "http://semicomplete.com/files/logstash/logstash-1.1.1-monolithic.jar"
  mode "0644"
  owner node[:logstash][:username]
  group node[:logstash][:groupname]
end

cookbook_file "/home/#{node[:logstash][:username]}/logstash.conf" do
  source "logstash.conf"
  mode "0644"
  owner node[:logstash][:username]
  group node[:logstash][:groupname]
end

cookbook_file "/home/#{node[:logstash][:username]}/phantom-metrics.rb" do
  source "phantom-metrics.rb"
  mode "0644"
  owner node[:logstash][:username]
  group node[:logstash][:groupname]
end

execute "Run logstash" do
  user node[:logstash][:username]
  group node[:logstash][:groupname]
  cwd "/home/#{node[:logstash][:username]}"
  environment({
    'HOME' => "/home/#{node[:logstash][:username]}",
    'METRICS_USERNAME' => node[:logstash][:metrics_username],
    'METRICS_PASSWORD' => node[:logstash][:metrics_password]
  })
  command "nohup java -jar logstash-1.1.1-monolithic.jar agent -f logstash.conf &"
end