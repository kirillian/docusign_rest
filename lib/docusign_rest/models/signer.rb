module DocusignRest
  class Signer
    include ActiveModel::Model
    include HashAttr

    hash_attr :embedded, :name, :email, :role_name

    validates_presence_of :embedded, :name, :email, :role_name
    validates :email, :email => true

    private
    def initialize(args = {})
      args[:embedded] ||= true
      super args
    end
  end
end
