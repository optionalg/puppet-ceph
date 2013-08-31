# = Class: ceph
#
# This is the main ceph class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, ceph class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $ceph_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, ceph main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $ceph_source
#
# [*source_dir*]
#   If defined, the whole ceph configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $ceph_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $ceph_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, ceph main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $ceph_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $ceph_options
#
# [*service_autorestart*]
#   Automatically restarts the ceph service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $ceph_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $ceph_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $ceph_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $ceph_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for ceph checks
#   Can be defined also by the (top scope) variables $ceph_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $ceph_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $ceph_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $ceph_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $ceph_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for ceph port(s)
#   Can be defined also by the (top scope) variables $ceph_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling ceph. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $ceph_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $ceph_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $ceph_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $ceph_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in ceph::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of ceph package
#
# [*service*]
#   The name of ceph service
#
# [*service_status*]
#   If the ceph service init script supports status argument
#
# [*process*]
#   The name of ceph process
#
# [*process_args*]
#   The name of ceph arguments. Used by puppi and monitor.
#   Used only in case the ceph process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user ceph runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $ceph_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $ceph_protocol
#
#
# See README for usage patterns.
#
class ceph (
  $dependency_class    = params_lookup( 'dependency_class' ),
  $use_cuttlefish      = params_lookup( 'use_cuttlefish' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits ceph::params {

  $bool_use_cuttlefish=any2bool($use_cuttlefish)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $ceph::bool_absent ? {
    true  => 'absent',
    false => $ceph::version,
  }

  $manage_service_enable = $ceph::bool_disableboot ? {
    true    => false,
    default => $ceph::bool_disable ? {
      true    => false,
      default => $ceph::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $ceph::bool_disable ? {
    true    => 'stopped',
    default =>  $ceph::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $ceph::bool_service_autorestart ? {
    true    => Service[ceph],
    false   => undef,
  }

  $manage_file = $ceph::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $ceph::bool_absent == true
  or $ceph::bool_disable == true
  or $ceph::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $ceph::bool_absent == true
  or $ceph::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $ceph::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $ceph::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $ceph::source ? {
    ''        => undef,
    default   => $ceph::source,
  }

  $manage_file_content = $ceph::template ? {
    ''        => undef,
    default   => template($ceph::template),
  }

  ### Prerequisites
  if $ceph::dependency_class {
    include $ceph::dependency_class
  }

  ### Managed resources
  package { $ceph::package:
    ensure  => $ceph::manage_package,
    noop    => $ceph::noops,
  }

  service { 'ceph':
    ensure     => $ceph::manage_service_ensure,
    name       => $ceph::service,
    enable     => $ceph::manage_service_enable,
    hasstatus  => $ceph::service_status,
    pattern    => $ceph::process,
    require    => Package[$ceph::package],
    noop       => $ceph::noops,
  }

  if $ceph::manage_file_source or $ceph::manage_file_content {
    file { 'ceph.conf':
      ensure  => $ceph::manage_file,
      path    => $ceph::config_file,
      mode    => $ceph::config_file_mode,
      owner   => $ceph::config_file_owner,
      group   => $ceph::config_file_group,
      require => Package[$ceph::package],
      notify  => $ceph::manage_service_autorestart,
      source  => $ceph::manage_file_source,
      content => $ceph::manage_file_content,
      replace => $ceph::manage_file_replace,
      audit   => $ceph::manage_audit,
      noop    => $ceph::noops,
    }
  }
  # The whole ceph configuration directory can be recursively overriden
  if $ceph::source_dir {
    file { 'ceph.dir':
      ensure  => directory,
      path    => $ceph::config_dir,
      require => Package[$ceph::package],
      notify  => $ceph::manage_service_autorestart,
      source  => $ceph::source_dir,
      recurse => true,
      purge   => $ceph::bool_source_dir_purge,
      force   => $ceph::bool_source_dir_purge,
      replace => $ceph::manage_file_replace,
      audit   => $ceph::manage_audit,
      noop    => $ceph::noops,
    }
  }


  ### Include custom class if $my_class is set
  if $ceph::my_class {
    include $ceph::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $ceph::bool_puppi == true {
    include ceph::puppi 
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $ceph::bool_monitor == true {
    if $ceph::port != '' {
      monitor::port { "ceph_${ceph::protocol}_${ceph::port}":
        protocol => $ceph::protocol,
        port     => $ceph::port,
        target   => $ceph::monitor_target,
        tool     => $ceph::monitor_tool,
        enable   => $ceph::manage_monitor,
        noop     => $ceph::noops,
      }
    }
    if $ceph::service != '' {
      monitor::process { 'ceph_process':
        process  => $ceph::process,
        service  => $ceph::service,
        pidfile  => $ceph::pid_file,
        user     => $ceph::process_user,
        argument => $ceph::process_args,
        tool     => $ceph::monitor_tool,
        enable   => $ceph::manage_monitor,
        noop     => $ceph::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $ceph::bool_firewall == true and $ceph::port != '' {
    firewall { "ceph_${ceph::protocol}_${ceph::port}":
      source      => $ceph::firewall_src,
      destination => $ceph::firewall_dst,
      protocol    => $ceph::protocol,
      port        => $ceph::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $ceph::firewall_tool,
      enable      => $ceph::manage_firewall,
      noop        => $ceph::noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $ceph::bool_debug == true {
    file { 'debug_ceph':
      ensure  => $ceph::manage_file,
      path    => "${settings::vardir}/debug-ceph",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $ceph::noops,
    }
  }

}
