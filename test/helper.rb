require_relative '../lib/docusign_rest'

require 'minitest/autorun'
require 'factory_girl'
# require 'turn'
require 'json'
require 'vcr'
require_relative 'docusign_login_config'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/vcr"
  c.hook_into :fakeweb
  c.default_cassette_options = { record: :new_episodes }
end

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions
