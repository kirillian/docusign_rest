module DocusignRest
  class Request < Model
    hash_attr :headers, :uri, :method

    validates_presence_of :uri

    def initialize(options = {})
      options[:headers] ||= {}
      options[:headers]['Content-Type'] = 'application/json'
      options[:method] ||= :get
      super options
    end
  end
end