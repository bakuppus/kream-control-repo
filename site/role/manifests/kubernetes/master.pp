class role::kubernetes::master {

  class {'kubernetes':
    controller          => true,
    bootstrap_controller => true,
  }

  include helm

  contain kubernetes
  contain helm

  Class['kubernetes']
  -> Class['helm']
}
