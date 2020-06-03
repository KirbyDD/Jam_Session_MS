class RequestHandler
  def quote_endpoint
    response = Faraday.get("https://type.fit/api/quotes")
    JSON.parse(response.body, symbolize_names: true).sample.to_json
  end

  def spotify_playlist_endpoint(token)
    response = Faraday.get("https://api.spotify.com/v1/me/playlists") do |f|
      f.headers["Authorization"] = "Bearer #{token}"
    end
    JSON.parse(response.body, symbolize_names: true).to_json
  end
end
