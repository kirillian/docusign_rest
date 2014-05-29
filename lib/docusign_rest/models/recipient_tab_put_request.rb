module DocusignRest
  class RecipientTabPutRequest < RecipientTabGetRequest
    hash_attr :body

    def build_body(tab_container)
      self.body = tab_container.attributes.json
    end

    def initialize(args = {})
      args[:method] = :put

      super args
    end
  end
end
