# site/profile/manifests/mysql.pp
class profile::mysql {
  # include ::mysql::server

  $override_options = {
    'mysqld' => {
      'bind_address' => $::networking['interfaces']['eth1']['ip'],
    }
  }

  class { '::mysql::server':
    override_options => $override_options,
  }
}
