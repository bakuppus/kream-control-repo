# Class: swarmconfig
class swarmconfig::master (

){

  class { 'docker':
    tcp_bind    => "tcp://${::ipaddress_eth0}:4243",
    socket_bind => 'unix:///var/run/docker.sock',
    }

  docker::swarm {'cluster_manager':
    init           => true,
    advertise_addr => $::ipaddress_eth0,
    listen_addr    => $::ipaddress_eth0,
    require        => Class['docker'],
  }

  docker::services { 'portainer':
    image        => 'portainer/portainer',
    publish      => '9000:9000',
    service_name => 'portainer',
    extra_params => ["--constraint 'node.role == manager'", '--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock'],
    host_socket  => 'unix:///var/run/docker.sock',
    require      => Docker::Swarm['cluster_manager'],
    }
}
