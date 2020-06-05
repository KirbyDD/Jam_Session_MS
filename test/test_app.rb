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

    assert formatted.include?(:text)
    assert formatted.include?(:author)
  end
end
