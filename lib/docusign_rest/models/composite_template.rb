module DocusignRest
  class CompositeTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :compositeTemplateId, :serverTemplates, :inlineTemplates, :pdfMetaDataTemplateSequence, :document

    validate :server_templates_valid
    validate :inline_templates_valid

    def initialize(template_ids, signers, sequence)
      template_ids.each { |template_id| add_template template_id, sequence }
      add_signers signers, sequence
    end

    private
    def add_template(template_id, sequence)
      add_server_template(ServerTemplate.new(:sequence => sequence.to_s, :templateId => template_id))
    end

    def add_signers(signers, sequence)
      add_inline_template(InlineTemplate.new(:sequence => sequence.to_s, :recipients => Recipients.new(:signers => signers)))
    end

    def add_inline_template(template)
      self.inlineTemplates ||= []
      self.inlineTemplates << template
    end

    def add_server_template(template)
      self.serverTemplates ||= []
      self.serverTemplates << template
    end

    def inline_templates_valid
      inlineTemplates.each do |template|
        self.errors.messages << template.errors.messages unless template.valid?
      end
    end

    def server_templates_valid
      serverTemplates.each do |template|
        self.errors.messages << template.errors.messages unless template.valid?
      end
    end
  end

  class ServerTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :sequence, :templateId

    validates_presence_of :sequence, :templateId
    validates :templateId, :docusign => true
  end
  class InlineTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :documentId, :name, :transformPdfFields, :sequence, :recipients

    validates_presence_of :sequence, :recipients
    validate :recipients_valid, :allow_blank => true

    def recipients_valid
      self.errors.messages << recipients.errors.messages unless recipients.valid?
    end
  end

  class Document
    include ActiveModel::Model
    include HashAttr

    hash_attr :documentId, :documentBase64

    validates_presence_of :documentId, :documentBase64
  end

  class Recipients
    include ActiveModel::Model
    include HashAttr

    hash_attr :signers

    def signers=(signers)
      attribute_hash[:signers] = signers.each_with_index { |signer, index| signer.recipientId = index + 1 }
    end

    validates_presence_of :signers
  end
end
