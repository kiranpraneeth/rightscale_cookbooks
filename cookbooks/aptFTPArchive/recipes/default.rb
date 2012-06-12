#
# Cookbook Name:: aptFTPArchive
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

rightscale_marker :begin

log "  Setting provider specific settings for APT FTP Archive"

case node[:platform]
when "ubuntu","debian"
  package "dpkg-dev" do
    action :install
  end
end

case node[:platform]
when "ubuntu","debian"
  package "apt-utils" do
    action :install
  end
end

case node[:platform]
when "ubuntu","debian"
  package "apache2" do
    action :install
  end
end



template "/etc/apt/apt-custom-release.conf" do
  source "apt-custom-release.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/apt/apt-ftparchive.conf" do
  source "apt-ftparchive.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/opt/mkhoj/ops/conf/inmobi-aptftp.conf" do
  source "inmobi-aptftp.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

case node[:platform]
when "ubuntu","debian"
  package "inmobi-aptftp-build-repo=node[:aptFTPArchive][:buildrepover] %>" do
    action :install
  end
end

