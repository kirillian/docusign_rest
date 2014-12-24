module DocusignRest
  class SendDraftEnvelope < Request

    hash_attr :envelope_id

    validates :envelope_id, :presence => true

    def uri
      "/envelopes/#{envelope_id}"
    end

    def body
      { 'status' => 'sent' }.to_json
    end

    private

    def initialize(args = {})
      args[:method] = :put
      super args
    end
  end
end
