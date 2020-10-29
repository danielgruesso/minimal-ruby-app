require 'webrick'
require 'securerandom'

server = WEBrick::HTTPServer.new :Port => ENV.fetch('PORT'){ 5000 }

#Return a successful Hello World response.
server.mount_proc '/' do |_request, response|
  #TODO: use HTML
  response.body = 'Hello branch01, commit02!,
  commit03,
  commit04'
  sleep 0.125 + SecureRandom.random_number*0.275
end

#Return an error to help demonstrate monitoring capabilities
server.mount_proc '/error' do |_request, response|
  response.status = 500
  response.body = 'Sorry we encountered an error.'
  sleep 1.0+SecureRandom.random_number
end

server.start
