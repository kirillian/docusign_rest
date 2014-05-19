module DocusignRest
  class Email < Model

    hash_attr :subject, :body

    validates_presence_of :subject, :body
  end
end