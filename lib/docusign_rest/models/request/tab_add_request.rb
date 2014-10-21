module DocusignRest
  class TabAddRequest < Request
    hash_attr :envelopeId, :recipientId

    attr_accessor :tab_container

    validates_presence_of :envelopeId, :recipientId, :tab_container

    def envelopeId=(envelope_id)
      attribute_hash[:envelopeId]= envelope_id
      build_uri
    end

    def recipientId=(recipient_id)
      attribute_hash[:recipientId]= recipient_id
      build_uri
    end

    def body
      tab_container.attributes.to_json
    end

    private

    def build_uri
      self.uri = "/envelopes/#{envelopeId}/recipients/#{recipientId}/tabs"
    end

    def initialize(args = {})
      args[:method] = :post
      super args
    end
  end
end
