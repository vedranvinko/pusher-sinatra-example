require 'dotenv'
require 'json'
require 'pusher'
require 'sinatra'

Dotenv.load

Pusher.app_id = ENV['PUSHER_APP_ID']
Pusher.key = ENV['PUSHER_APP_KEY']
Pusher.secret = ENV['PUSHER_APP_SECRET']
Pusher.cluster = 'mt1'
Pusher.encrypted = true

get '/' do
  'ping'
end

post '/msg' do
  payload = JSON.parse(request.body.read)
  Pusher.trigger('my-channel', 'my-event', { message: payload['message'] })
end
