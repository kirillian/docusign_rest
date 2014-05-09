module DocusignRest
  class Email
    include ActiveModel::Model
    include HashAttr

    hash_attr :subject, :body

    validates_presence_of :subject, :body
  end
end