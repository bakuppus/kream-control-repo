# Class: swarmconfig
class swarmconfig::worker (

){

  class { 'docker':
    socket_bind => 'unix:///var/run/docker.sock',
    }

  docker::swarm {'cluster_worker':
    join           => true,
    advertise_addr => $::ipaddress_eth0,
    listen_addr    => $::ipaddress_eth0,
    manager_ip     => '172.17.10.101',
    token          => $::swarm_token,
    require        => Class['docker'],
  }
}
