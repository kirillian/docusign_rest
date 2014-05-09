module DocusignRest
  class CompositeTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :compositeTemplateId, :serverTemplates, :inlineTemplates, :pdfMetaDataTemplateSequence, :documents

    def add_inline_template(template)
      self.inlineTemplates||= []
      self.inlineTemplates << template if template.valid?
    end

    def add_server_template(template)
      self.serverTemplates||= []
      self.serverTemplates << template if template.valid?
    end
  end

  class ServerTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :sequence, :templateId

    validates_presence_of :sequence, :templateId
  end
  class InlineTemplate
    include ActiveModel::Model
    include HashAttr

    hash_attr :documentId, :name, :transformPdfFields

    validates_presence_of :documentId, :name, :transformPdfFields
  end

  class Document
    include ActiveModel::Model
    include HashAttr

    hash_attr :documentId, :documentBase64

    validates_presence_of :documentId, :documentBase64
  end
end
