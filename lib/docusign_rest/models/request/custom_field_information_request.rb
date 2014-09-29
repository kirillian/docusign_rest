module DocusignRest
  class CustomFieldInformationRequest < Request

    hash_attr :envelopeId

    validates_presence_of :envelopeId

    def envelopeId=(envelopeId)
      self.uri = "/envelopes/#{envelopeId}/custom_fields"
      attribute_hash[:envelopeId] = envelopeId
    end
  end
end