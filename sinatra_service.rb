require 'sinatra'
require 'faraday'
require 'pry'


  get '/quote' do
    response = Faraday.get("https://type.fit/api/quotes")
    quote_obj = JSON.parse(response.body, symbolize_names: true).sample
    quote_obj.to_json
  end

  get '/playlists/:token' do
    response = Faraday.get("https://api.spotify.com/v1/me/playlists") do |f|
      f.headers["Authorization"] = "Bearer #{params[:token]}"
    end
    playlists = JSON.parse(response.body, symbolize_names: true)
    playlists.to_json
  end
