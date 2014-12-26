module DocusignRest
  class TabAddRequest < Request
    hash_attr :envelopeId, :recipientId

    attr_accessor :tab_container

    validates_presence_of :envelopeId, :recipientId, :tab_container

    def uri
      "/envelopes/#{envelopeId}/recipients/#{recipientId}/tabs"
    end

    def body
      tab_container.attributes.to_json
    end

    private

    def initialize(args = {})
      args[:method] = _method
      super args
    end

    def _method
      :post
    end
  end
end
