module Docusign
  class Document
    include ActiveModel::Model
    include HashAttr

    hash_attr :document_id, :signers
  end
end