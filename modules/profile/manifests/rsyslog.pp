class profile::rsyslog {
  $log_proto    = 'tcp',
  $log_port     = '601',
  $log_serv     = '192.168.56.10',
  $sonar = {
    log_name => '/usr/local/sonar/logs/*.log',
    app_name => 'sonar',
    severity => 'info',
  }
  $apps   = [$sonar]

  rsyslog::client { 'app' :
    log_proto    => $log_proto,
    log_port     => $log_port,
    log_serv     => $log_serv,
    apps         => $apps,
  }
}