module DocusignRest
  class EnvelopeFromTemplateRequest
    include ActiveModel::Model
    include HashAttr

    hash_attr :status, :email, :template_id, :signers, :compositeTemplates

    validates_presence_of :status, :template_id, :signers, :email
    validates :template_id, :docusign => true

    def initialize(args = {})
      args[:status] ||= :sent
      args[:signers] ||= []
      args[:compositeTemplates] ||= []
      super args
    end
  end
end