require 'webrick'
require 'securerandom'

server = WEBrick::HTTPServer.new :Port => 5000

#The following proc is used to customize the server operations
server.mount_proc '/' do |request, response|
  response.body = 'Hello, improved world!'
  sleep 0.125 + SecureRandom.random_number*0.250
end

server.mount_proc '/error' do |request, response|
  response.status = 500
  response.body = 'Sorry we encountered an error.'
  sleep 1.0+SecureRandom.random_number
end

server.start