maintainer       "InMobi"
maintainer_email "hemant.burman@inmobi.com"
license          "All rights reserved"
description      "Installs/Configures aptFTPArchive"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "rightscale"

recipe  "aptFTPArchive::default", "Installs APT FTP Archive server."

attribute "aptFTPArchive/suite",
  :display_name => "APT FTP Archive Suites",
  :description => "A space-separated list of Suites",
  :type => "string",
  :default => "beta prod",
  :required => "required"

attribute "aptFTPArchive/codename",
  :display_name => "APT FTP Archive codename",
  :description => "Codename",
  :type => "string",
  :default => "prod",
  :required => "required"

attribute "aptFTPArchive/architectures",
  :display_name => "APT FTP Archive Architectures",
  :description => "A space-separated list of Architectures",
  :type => "string",
  :default => "amd64 i386 i686",
  :required => "required"

attribute "aptFTPArchive/components",
  :display_name => "APT FTP Archive Components",
  :description => "A space-separated list oC components",
  :type => "string",
  :default => "main ops 3ppours 3pp",
  :required => "required"
