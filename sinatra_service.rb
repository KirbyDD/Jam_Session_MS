require 'sinatra'
require 'faraday'
require 'pry'


  get '/quote' do
    response = Faraday.get("https://type.fit/api/quotes")
    JSON.parse(response.body, symbolize_names: true).sample
  end

  get '/playlists/:token' do
    response = Faraday.get("https://api.spotify.com/v1/me/playlists") do |f|
      f.headers["Authorization"] = "Bearer #{params[:token]}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
