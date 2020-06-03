require 'sinatra'
require 'faraday'
require_relative 'request_handler'

class JamSessionError < StandardError; end
