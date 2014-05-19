module DocusignRest
  class RecipientsGetRequest < Request
    hash_attr :envelopeId

    validates_presence_of :envelopeId

    def envelopeId=(envelopeId)
      self.uri = "/envelopes/#{envelopeId}/recipients"
      attribute_hash[:envelopeId] = envelopeId
    end
  end
end