# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'
require 'twitter'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Set up the Twitter environment

env_config = YAML.load_file(APP_ROOT.join('config','twitter.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "IkSjT0v7UcP2mkZFfTM3Zg" #api key
  config.consumer_secret     = "d3mctB4inrX8vL6xOM6odONSf1Pedi8wxv0PZPC72PI"   #api secret
  config.access_token        = "21767394-EcABMUoLTsvP2pJDBLF0fk6ahvhJXqLZIr6sydZOX"
  config.access_token_secret = "0qpBVgmexPNpKbP8ER2vB2kOkpqAORSHpIOvxHLnbPVi9"
end





