require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../lib/sinatra_service.rb', __FILE__
