require_relative 'recipients_get_request'

module DocusignRest
  class RecipientsDeleteRequest < RecipientsGetRequest
    hash_attr :recipientId

    validates_presence_of :recipientId

    def initialize(args = {})
      args[:method] = :delete
      super args
    end

    def body
      {'signers' =>[{'recipientId' => recipientId.to_s}]}.to_json
    end
  end
end