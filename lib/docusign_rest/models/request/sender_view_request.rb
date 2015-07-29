module DocusignRest
  class SenderViewRequest < Request
    hash_attr :envelopeId, :returnUrl

    validates_presence_of :envelopeId, :returnUrl

    def body
      { 'returnUrl' => returnUrl }
    end

    def uri
      "/envelopes/#{envelopeId}/views/sender"
    end

    private

    def initialize(options = {})
      options[:method] = :post
      super options
    end
  end
end
