class profile::app_server {

  include chocolatey

  if $facts['os']['family'] == 'windows' {
    registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability':
      ensure => present,
    }
  }

  if $facts['os']['family'] == 'windows' {
    registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
      ensure => present,
      data   => '0',
      type   => 'dword',
    }
  }

  file { 'c:\temp':
    ensure => 'directory',
  }

  file { 'c:\temp\test.txt':
    content => 'This is the content of my test file!',
  }

  package { 'powershell':
    ensure   => '5.0.10586.20161216',
    provider => 'chocolatey',
    source   => 'http://192.168.34.100/choco/api/v2/',
  }

}
