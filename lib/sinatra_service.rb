require_relative 'service_requirements'

class JamSessionService < Sinatra::Base

  get '/quote' do
    handle_request(:quote)
  end

  get '/playlists/:spotify_token' do
    handle_request(:playlists)
  end

  def handle_request(endpoint)
    begin
      request = RequestHandler.new
      if endpoint == :quote
        request.quote_endpoint
      elsif endpoint == :playlists
        request.spotify_playlist_endpoint(params[:spotify_token])
      end
    rescue JamSessionError => e
      [400, {}, {'message' => 'Bad Request'}.to_json]
    rescue StandardError => e
      puts e.message
      [500, {}, {'message' => 'Oops... It broke.'}.to_json]
    end
  end
end
