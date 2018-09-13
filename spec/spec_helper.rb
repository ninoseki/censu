# frozen_string_literal: true

require 'dotenv/load'
require 'rspec'
require 'vcr'
require 'censys'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |_|
  include Censys
end

def authorization_field
  require 'base64'
  token = "#{ENV['CENSYS_ID']}:#{ENV['CENSYS_SECRET']}"
  "Basic #{Base64.strict_encode64(token)}"
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<CENSORED>") { authorization_field }
  %w(CENSYS_ID CENSYS_SECRET CENSYS_EMAIL CENSYS_LOGIN).each do |key|
    config.filter_sensitive_data("<CENSORED>") { ENV[key] }
  end
end
