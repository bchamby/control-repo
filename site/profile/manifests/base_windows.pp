class profile::base_windows {

  $script = @(EOF)
    $nicd = (gwmi win32_networkadapterconfiguration | ? {$_.ipaddress -like "192.168.50.*"}).description
    $nic = get-netadapter | ? {$_.interfacedescription -eq $nicd}
    $nic | set-netipinterface -dhcp enabled
    | EOF

    exec { 'set-dhcpenabled':
      command => $script,
      provider => powershell,
    }
    
}
