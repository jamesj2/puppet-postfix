# Class postfix::install
#
# Installs postfix

class postfix::install (
    # To install postfix-mysql package instead of plain postfix (EL5)
    $mysql                  = false,
    $postfix_package        = $::postfix::params::postfix_package,
    $postfix_mysql_package  = $::postfix::params::postfix_mysql_package,
    $postfix_package_ensure = $::postfix::params::postfix_package_ensure,
){

    # Main package and service it provides

    if $mysql {
        $package_name = $postfix_mysql_package
    } else {
        $package_name = $postfix_package
    }

    package { $package_name:
        ensure => $postfix_package_ensure,
        alias => 'postfix'
    }

}
