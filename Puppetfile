#!/usr/bin/ruby env

require "socket"
$hostname = Socket.gethostname

forge 'http://forge.puppetlabs.com'

mod 'puppetlabs/kubernetes',
  :git => 'git@github.com:puppetlabs/puppetlabs-kubernetes.git'
mod 'puppetlabs/helm',
  :git => 'git@github.com:puppetlabs/puppetlabs-helm.git'
mod 'puppetlabs/stdlib'
mod 'puppetlabs/apt'
mod 'stahnma-epel'
mod 'puppet-archive'
