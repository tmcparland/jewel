$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'simplecov'
SimpleCov.start
require 'jewel'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
require 'support/vcr_setup'