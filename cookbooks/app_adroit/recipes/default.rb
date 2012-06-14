#
# Cookbook Name:: app_adroit
#
# Copyright Inmobi, Inc. All rights reserved.

rightscale_marker :begin

log "  Setting provider specific settings for tomcat"
node[:app][:provider] = "app-adroit"

# Preparing list of packages based on functionality
case node[:platform]
when "ubuntu", "debian"
  log "Entered Ubuntu platform case"
  case node[:app_adroit][:function]
  when "backend"
    log "Entered backend type case"
    node[:app][:packages] = [
    "roi-tracker-cron-package=1339489594",
    "roi-feedback-package=1339489606",
    "inmobi-ivory-client=0.1.4",
    "libapparmor-perl",
    "libbit-vector-perl",
    "libcarp-clan-perl",
    "libclass-accessor-perl",
    "libcommon-sense-perl",
    "libconfig-general-perl",
    "libconfig-tiny-perl",
    "libdate-manip-perl",
    "libdbd-pg-perl",
    "libdbi-perl",
    "liberror-perl",
    "libfont-afm-perl",
    "libhtml-format-perl",
    "libhtml-parser-perl",
    "libhtml-tagset-perl",
    "libhtml-tree-perl",
    "libio-pty-perl",
    "libio-string-perl",
    "libipc-run-perl",
    "libjson-perl",
    "libjson-xs-perl",
    "liblocale-gettext-perl",
    "liblog-dispatch-filerotate-perl",
    "liblog-dispatch-perl",
    "liblog-log4perl-perl",
    "libmailtools-perl",
    "libmath-calc-units-perl",
    "libnagios-plugin-perl",
    "libnet-daemon-perl",
    "libparams-validate-perl",
    "libparse-debianchangelog-perl",
    "libperl5.10",
    "libplrpc-perl",
    "libproc-daemon-perl",
    "librpc-xml-perl",
    "libsub-name-perl",
    "libterm-readkey-perl",
    "libtext-charwidth-perl",
    "libtext-glob-perl",
    "libtext-iconv-perl",
    "libtext-wrapi18n-perl",
    "libtime-modules-perl",
    "libtimedate-perl",
    "liburi-perl",
    "libwww-perl",
    "libxml-libxml-perl",
    "libxml-namespacesupport-perl",
    "libxml-parser-perl",
    "libxml-sax-expat-perl",
    "libxml-sax-perl",
    "libxml-simple-perl",
    "libyaml-perl",
    "libyaml-syck-perl",
    "perl",
    "perl-base",
    "perl-doc",
    "perl-modules",
    ]
  when "frontend"
    log "Entered frontend type case"
    node[:app][:packages] = [
    "com.mkhoj.datalogger-mkhoj-data_logger-",
    "com.mkhoj.util-mkhoj-msisdn-lib",
    "download-tracker.phoenix.worker-initwor",
    "download-tracker.phoenix.worker-respons",
    "inmobi-adroit-integration",
    "inmobi-apptracker-phoenix-conf",
    "inmobi-download-server-conf",
    "inmobi-narada-keys",
    "inmobi-service-narada",
    "mkhoj-analytics-beacon-server",
    "nginx-johndoe",
    "phoenix-libjava-com.googlecode.json-sim",
    "phoenix-libjava-commons-beanutils-commo",
    "phoenix-libjava-commons-beanutils-commo",
    "phoenix-libjava-commons-collections-com",
    "phoenix-libjava-commons-configuration-c",
    "phoenix-libjava-commons-digester-common",
    "phoenix-libjava-commons-lang-commons-la",
    "phoenix-libjava-commons-logging-commons",
    "phoenix-libjava-junit-junit",
    "phoenix-libjava-log4j-log4j",
    "phoenix-libjava-net.sourceforge.wurfl-w",
    "phoenix-libjava-org.json-json",
    "phoenix-libjava-org.springframework-spr",
    "phoenix-libjava-postgresql-postgresql",
    "phoenix.core-phoenix",
    "phoenix.data-data",
    "phoenix.entity-ccid",
    "phoenix.entity-handset",
    "phoenix.tracker-download-tracker",
    "phoenix.transporter-transporter",
    "phoenix.util-util",
    "phoenix.worker-jsonlogger",
    "phoenix.workergroup-workergroup",
    "inmobi-loop",
    "libapparmor-perl",
    "libclass-accessor-perl",
    "libdate-manip-perl",
    "liberror-perl",
    "libfont-afm-perl",
    "libhtml-format-perl",
    "libhtml-parser-perl",
    "libhtml-tagset-perl",
    "libhtml-tree-perl",
    "libio-pty-perl",
    "libio-string-perl",
    "libipc-run-perl",
    "liblocale-gettext-perl",
    "liblog-dispatch-filerotate-perl",
    "liblog-dispatch-perl",
    "liblog-log4perl-perl",
    "libmailtools-perl",
    "libparams-validate-perl",
    "libparse-debianchangelog-perl",
    "libperl5.10",
    "librpc-xml-perl",
    "libsub-name-perl",
    "libterm-readkey-perl",
    "libtext-charwidth-perl",
    "libtext-glob-perl",
    "libtext-iconv-perl",
    "libtext-wrapi18n-perl",
    "libtimedate-perl",
    "liburi-perl",
    "libwww-perl",
    "libxml-libxml-perl",
    "libxml-namespacesupport-perl",
    "libxml-parser-perl",
    "libxml-sax-expat-perl",
    "libxml-sax-perl",
    "libxml-simple-perl",
    "libyaml-perl",
    "libyaml-syck-perl",
    "perl",
    "perl-base",
    "perl-doc",
    "perl-modules",
    ]
  when "gboconsole"
    log "Entered frontend type case"
    node[:app][:packages] = [
      "adroit-console",
      "gbo-script"
    ]
  else
    raise "Unrecognized function #{node[:app_adroit][:function]}, exiting "
  end
else
  raise "Unrecognized distro #{node[:platform]}, exiting "
end

#Using app-adroit cookbook and installing the required packages using APT
app_adroit "default" do
  persist true
  provider node[:app][:provider]
  packages node[:app][:packages]
  action :install
end

rightscale_marker :end
