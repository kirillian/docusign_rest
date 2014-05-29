require_relative 'recipients_get_request'

module DocusignRest
  class RecipientsAddRequest < RecipientsGetRequest
    hash_attr :signers

    attr_accessor :resend_envelope

    validates_presence_of :signers
    validate :signers_valid, :allow_blank => true

    def uri=(uri)
      attribute_hash[:uri] = uri + (resend_envelope ? '?resend_envelope=true' : '')
    end

    def body
      attributes.to_json
    end

    def << signer
      (self.signers ||= []) << signer
    end

    def initialize(args = {})
      args[:signers] ||= []
      args[:method] = :post
      self.resend_envelope = true
      super args
    end

    private
    def signers_valid
      if signers.nil?
        self.errors.add(:signers, 'no signers')
        return false
      end

      self.errors.add(:signers, 'no signers') if signers.empty?
      signers.each do |signer|
        self.errors.messages.merge!(signer.errors.messages) unless signer.valid?
      end
    end
  end
end
