#
# Cookbook Name:: app
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# = Default application server provider
#

# Stop application
action :stop do
  raise 'Using "default" application provider.  Action is not implemented'
end


# Start application
action :start do
  raise 'Using "default" application provider.  Action is not implemented'
end


# Restart application
action :restart do
  raise 'Using "default" application provider.  Action is not implemented'
end

action :install do
  log "  Entered app_adroit install action"
  packages = new_resource.packages
  log "  Packages which will be installed: #{packages}"
  v = ""
  packages .each do |p|
    if ( p =~ /(.*)=(.*)/ )
       log "   Version defined in #{p} so spliting"
       p = $1
       v = $2
       package p do
          version "#{v}"
          log "   Package is #{p} and version #{v}"
          log "   installing #{p} #{v}"
       end
    else
       package p
    end
end

# Setup application vhost
action :setup_vhost do
  raise 'Using "default" application provider.  Action is not implemented'
end


# Setup application Database Connection
action :setup_db_connection do
  raise 'Using "default" application provider.  Action is not implemented'
end


# Download/Update application repository
action :code_update do
  raise 'Using "default" application provider.  Action is not implemented'
end
