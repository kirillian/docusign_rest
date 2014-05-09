module DocusignRest
  class RecipientViewRequest
    include ActiveModel::Model
    include HashAttr

    hash_attr :envelope_id, :name, :email, :return_url

    validates_presence_of :envelope_id, :name, :email, :return_url
    validates :email, :email => true
    validates :envelope_id, :docusign => true

    private
    def initialize(args = {})
      signer = args.delete :signer
      envelope = args.delete :envelope

      args[:envelope_id] = envelope.envelopeId unless envelope.nil?
      args[:name] = signer.name unless signer.nil?
      args[:email] = signer.email unless signer.nil?

      super args
    end
  end
end