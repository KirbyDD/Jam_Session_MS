require 'sinatra'
require 'faraday'
require 'pry'

get '/quote' do
  response = Faraday.get("https://type.fit/api/quotes")
  JSON.parse(response.body, symbolize_names: true).sample
end
