require_relative 'config/environment'
require 'rack/attack'

run Rails.application
Rails.application.load_server
use Rack::Attack