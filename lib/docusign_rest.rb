require 'active_model'
require 'hash_attr'
require_relative 'docusign_rest/version'
require_relative 'docusign_rest/configuration'
require_relative 'docusign_rest/client'
require_relative 'docusign_rest/utility'
require_relative 'docusign_rest/models/model'
Dir.glob("#{File.dirname(__FILE__)}/docusign_rest/validators/*.rb").each { |file| require "#{File.dirname(file)}/#{File.basename(file, '.rb')}" }
Dir.glob("#{File.dirname(__FILE__)}/docusign_rest/models/*.rb").each     { |file| require "#{File.dirname(file)}/#{File.basename(file, '.rb')}" }
Dir.glob("#{File.dirname(__FILE__)}/docusign_rest/models/tab/*.rb").each     { |file| require "#{File.dirname(file)}/#{File.basename(file, '.rb')}" }
require_relative 'docusign_rest/models/request/request'
Dir.glob("#{File.dirname(__FILE__)}/docusign_rest/models/request/*.rb").each { |file| require "#{File.dirname(file)}/#{File.basename(file, '.rb')}" }
Dir.glob("#{File.dirname(__FILE__)}/docusign_rest/models/response/*.rb").each { |file| require "#{File.dirname(file)}/#{File.basename(file, '.rb')}" }

require 'multipart_post' #require the multipart-post gem itself
require 'net/http/post/multipart' #require the multipart-post net/http/post/multipart monkey patch
require_relative 'multipart_post/parts' #require my monkey patched parts.rb which adjusts the build_part method
require 'net/http'
require 'json'

module DocusignRest
  require_relative "docusign_rest/railtie" if defined?(Rails)

  extend Configuration
end
