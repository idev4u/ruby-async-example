# myapp.rb
require 'sinatra'
require 'json'
require 'rest-client'
require 'concurrent'

class HttpClient
  include Concurrent::Async

  def get(url)
    RestClient.get(url)
  end
end

# Configure Sinatra
configure do
  set :port, 8088
end

before do
  logger.level = 0
  request.body.rewind
end

# expose the access to the request
before do
  request.body.rewind
end

# simple post
post '/test2' do
  request_payload = JSON.parse request.body.read
  puts request_payload['name']
  request_payload['name']
end

# non blocking get to a extrnal url
get '/testasync' do
  client = HttpClient.new
  client.async.get('http://localhost:8082')
  return 204
end
