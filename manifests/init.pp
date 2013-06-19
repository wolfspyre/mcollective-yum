# == Class: mco_yum
#
# An mcollective plugin and puppet module to providing mcollective greater flexibility with yum
#
# copied from https://github.com/slaney/mcollective-plugins and adapted to a module.
#
# === Parameters
#
# === Variables
#
#
# === Examples
#
# class mco_yum
#
# === Authors
#
# Wolf Noble <wolf@wolfspyre.com>
#
# === Copyright
#
# Copyright 2013
#
class mco_yum (
  $mcodir = '/opt/puppet/libexec/mcollective/mcollective/'){
  #set some defaults
  File{
    ensure => 'file',
    group  => 'root',
    mode   => '0644',
    owner  => 'root',
    notify => Service['pe-mcollective'],
  }
  file {"${mcodir}/agent/yum.rb":
    source => "puppet:///modules/${module_name}/yum.rb",
  }
  if $::fact_is_puppetmaster {
    #only deploy the ddl if we're a puppetmaster
    file {"${mcodir}/agent/rpmverify.ddl":
      source => "puppet:///modules/${module_name}/yum.ddl",
    }
  }

}
