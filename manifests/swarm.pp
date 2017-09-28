node /^swarm-01/ {

  class { 'swarmconfig':
    is_master => true,
  }
}
node /^swarm-0(2|3)/ {
    include swarmconfig
}
