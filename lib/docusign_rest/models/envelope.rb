module DocusignRest
  class Envelope < Model

    hash_attr :envelopeId, :uri, :statusDateTime, :status
    validates_presence_of :envelopeId, :uri, :statusDateTime, :status
  end
end
