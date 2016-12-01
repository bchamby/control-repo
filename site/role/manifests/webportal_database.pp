# site/role/manifests/webportal_database.pp
class role::webportal_database {
  include profile::base
  include profile::webportal_database
  include profile::mysql
}
