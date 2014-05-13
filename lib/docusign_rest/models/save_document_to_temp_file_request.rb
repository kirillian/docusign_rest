module DocusignRest
  class SaveDocumentToTempFileRequest
    include ActiveModel::Model
    include HashAttr

    hash_attr :envelope_id, :document_id, :temp_file_path, :encoding

    validates_presence_of :envelope_id, :document_id, :temp_file_path
    validates :envelope_id, :docusign => true

    private
    def initialize(args = {})
      envelope = args.delete :envelope
      args[:envelope_id] = envelope.envelopeId unless envelope.nil?
      args[:encoding] ||= 'ascii-8bit'

      super args
    end
  end
end