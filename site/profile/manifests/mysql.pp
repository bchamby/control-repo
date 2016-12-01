# site/profile/manifests/mysql.pp
class profile::mysql {
  include ::mysql::server
}
