module DocusignRest
  class Signer < Model

    hash_attr *(%i(
            clientUserId
            deliveredDateTime
            email
            embedded
            name
            note
            recipientAuthenticationStatus
            recipientId
            recipientIdGuid
            requireIdLookup
            roleName
            routingOrder
            signInEachLocation
            signedDateTime
            status
            tabs
            templateLocked
            templateRequired
            userId))

    validates_presence_of :embedded, :name, :email, :roleName, :recipientId
    validates :email, :email => true

    def recipientId=(id)
      attribute_hash[:recipientId] = id.to_s unless id.nil?
    end

    def email=(email)
      attribute_hash[:email]=email
      attribute_hash[:clientUserId]=email
    end

    private
    def initialize(args = {})
      args[:embedded] ||= 'true'
      super args
    end
  end
end
