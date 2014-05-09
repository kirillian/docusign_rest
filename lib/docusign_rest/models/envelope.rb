module DocusignRest
  class Envelope
    include ActiveModel::Model
    include HashAttr

    hash_attr :envelopeId, :uri, :statusDateTime, :status
    validates_presence_of :envelopeId, :uri, :statusDateTime, :status
  end
end
