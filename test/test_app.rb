require 'test_helper'
require 'sinatra_service.rb'

class MyTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    JamSessionService
  end

  def test_it_returns_a_quote
    response = get '/quote'
    formatted = JSON.parse(response.body, symbolize_names: true)

    assert_instance_of(Hash, formatted)
    assert formatted.include?(:text)
    assert formatted.include?(:author)
  end

  def test_it_returns_a_list_of_playlists
    skip
    # ENV Variable broken - Test passes with hard coded token
    response = get "/playlists/#{ENV['SPOTIFY_TOKEN']}"
    formatted = JSON.parse(response.body, symbolize_names: true)

    assert_instance_of(Hash, formatted)
    assert formatted[:items][0].include?(:href)
    assert formatted[:items][0].include?(:name)
    assert formatted[:items][2].include?(:href)
    assert formatted[:items][2].include?(:name)
  end
end
