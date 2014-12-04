module DocusignRest
  class Model
    include ActiveModel::Model
    include HashAttr

    def errorDetails=(error)
      message = error['message']
      fail message unless message.blank?
    end
  end
end
