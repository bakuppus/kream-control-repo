node 'kube-master' {
  include role::kubernetes::master
}

node /^kube-replica-master/ {
  include role::kubernetes::controller
}

node /^kube-node/  {
  include role::kubernetes::worker
}

node /docker/ {
  class {'docker':
    version => '1.12.3-0~xenial',
  }
}
