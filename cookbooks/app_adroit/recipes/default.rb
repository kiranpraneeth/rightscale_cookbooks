#
# Cookbook Name:: app_adroit
#
# Copyright Inmobi, Inc. All rights reserved.

rightscale_marker :begin

log "  Setting provider specific settings for tomcat"

# Preparing list of packages based on functionality
case node[:platform]
when "ubuntu", "debian"
  log "Entered Ubuntu platform case"
  case node[:app_adroit][:function]
  when "backend"
    log "Entered backend type case"
    node[:app_adroit][:packages] = [
    "roi-tracker-cron-package=1340181767",
    "roi-feedback-package=1340181994",
    "inmobi-ivory-client",
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
    node[:app_adroit][:packages] = [
    #"com.mkhoj.datalogger-mkhoj-data_logger-lib",
    "download-tracker.phoenix.worker-initworker",
    "download-tracker.phoenix.worker-responsewriter",
    "mkhoj-download-tracker-cfg",
    "phoenix.core-phoenix",
    "phoenix.data-data",
    "phoenix.entity-ccid",
    "phoenix.entity-handset",
    "phoenix-libjava-com.googlecode.json-simple-json-simple",
    "phoenix-libjava-commons-beanutils-commons-beanutils",
    "phoenix-libjava-commons-beanutils-commons-beanutils-core",
    "phoenix-libjava-commons-collections-commons-collections",
    "phoenix-libjava-commons-configuration-commons-configuration",
    "phoenix-libjava-commons-digester-commons-digester",
    "phoenix-libjava-commons-lang-commons-lang",
    "phoenix-libjava-commons-logging-commons-logging",
    "phoenix-libjava-junit-junit",
    "phoenix-libjava-log4j-log4j",
    "phoenix-libjava-net.sourceforge.wurfl-wurfl",
    "phoenix-libjava-org.json-json",
    "phoenix-libjava-org.springframework-spring-beans",
    "phoenix-libjava-org.springframework-spring-context",
    "phoenix-libjava-org.springframework-spring-core",
    "phoenix-libjava-org.springframework-spring-support",
    "phoenix-libjava-org.springframework-spring-web",
    "phoenix-libjava-postgresql-postgresql",
    "phoenix.tracker-download-tracker",
    "phoenix.transporter-transporter",
    "phoenix.util-util",
    "phoenix.workergroup-workergroup",
    "phoenix.worker-jsonlogger",
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
  else
    raise "Unrecognized function #{node[:app_adroit][:function]}, exiting "
  end
  when "gboconsole"
    log "Entered gbovonsole type case"
    node[:app_adroit][:packages] = [
      "adroit-console=1.0-1340184008",
      "gbo-script=1.0-1333353552",
      "django=1.2-1284962466",
      "adroitnginx-gboconsole-script-conf=0.1.0-1339760848",
      "libpython2.6",
      "python",
      "python-apt",
      "python-central",
      "python-cheetah",
      "python-crypto",
      "python-egenix-mxdatetime",
      "python-egenix-mxtools",
      "python-flup",
      "python-gdbm",
      "python-gnupginterface",
      "python-minimal",
      "python-newt",
      "python-psycopg2",
      "python-support",
      "python-webpy",
      "python2.6",
      "python2.6-minimal",
    ]
  else
    raise "Unrecognized function #{node[:app_adroit][:function]}, exiting "
  end
else
  raise "Unrecognized distro #{node[:platform]}, exiting "
end

#Using app-adroit cookbook and installing the required packages using APT
app_adroit "install_packages" do
  persist true
  packages node[:app_adroit][:packages]
  action :install
end

case node[:platform]
when "ubuntu", "debian"
  log "Entered Ubuntu platform case"
  case node[:app_adroit][:function]
  when "gboconsole"
     log "Entered gboconsole django setup"
     app_adroit "setup_django" do
         persist true
         node[:app_adroit][:django_base] = "/opt/mkhoj/var/django/adroit_console/manage.py"
         action :setup_django
     end
  else
      raise "Unrecognized distro #{node[:platform]}, exiting "
  end
end
