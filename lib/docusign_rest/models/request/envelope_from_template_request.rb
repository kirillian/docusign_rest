module DocusignRest
  class EnvelopeFromTemplateRequest < Model

    hash_attr :status, :email, :signers, :compositeTemplates, :template_id

    validates_presence_of :status, :email, :compositeTemplates
    validate :composite_templates_valid

    def initialize(args = {})
      args[:status] ||= :sent
      args[:compositeTemplates] ||= []
      super args
    end

    def composite_templates_valid
      compositeTemplates.each do |compositeTemplate|
        self.errors.messages.merge! compositeTemplate.errors.messages unless compositeTemplate.valid?
      end
    end
  end
end