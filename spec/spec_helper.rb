require 'dotenv/load'
require 'rspec'
require 'vcr'
require 'censys'

include Censys

def authorization_field
  require 'base64'
  "Basic #{Base64.strict_encode64(ENV["CENSYS_ID"] + ":" + ENV["CENSYS_SECRET"])}"
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<CENSORED>") { authorization_field }
end
