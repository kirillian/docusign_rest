require_relative '../lib/docusign_rest'

require 'minitest/spec'
require 'minitest/autorun'
require 'factory_girl'
require 'turn'
require 'json'
require 'vcr'
require_relative 'docusign_login_config'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/vcr"
  c.hook_into :fakeweb
  c.default_cassette_options = { record: :all }
end

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions