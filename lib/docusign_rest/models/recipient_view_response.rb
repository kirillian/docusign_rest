module DocusignRest
  class RecipientViewResponse
    include ActiveModel::Model
    include HashAttr

    hash_attr :url
  end
end
