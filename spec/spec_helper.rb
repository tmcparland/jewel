$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'jewel'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
require 'support/vcr_setup'