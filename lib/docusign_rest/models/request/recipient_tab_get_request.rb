module DocusignRest
  class RecipientTabGetRequest < Request
    hash_attr :envelopeId, :recipientId

    validates_presence_of :envelopeId, :recipientId

    def envelopeId=(envelope_id)
      attribute_hash[:envelopeId]= envelope_id
      build_uri
    end

    def recipientId=(recipient_id)
      attribute_hash[:recipientId]= recipient_id
      build_uri
    end

    def build_uri
      self.uri = "/envelopes/#{envelopeId}/recipients/#{recipientId}/tabs"
    end
  end
end