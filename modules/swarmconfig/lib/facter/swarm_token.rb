require 'net/http'
require 'uri'
require 'json'
require 'facter'

Facter.add('swarm_token') do
  
  setcode do
    def swarm_token
      uri = URI.parse("http://172.17.10.101:4243/v1.24/swarm")
      request = Net::HTTP::Get.new(uri.to_s)
      response = Net::HTTP.start(uri.hostname, uri.port) do |http| 
        http.request(request)
      end
      data = JSON.parse(response.body)['JoinTokens']['Worker']
      return data
    end
   swarm_token
  end
end  
