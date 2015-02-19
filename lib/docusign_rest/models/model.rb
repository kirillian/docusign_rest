module DocusignRest
  class Model
    include ActiveModel::Model
    include HashAttr

    def errorDetails=(error)
      message = error['message']
      fail message unless message.blank?
    end

    def method_missing(method, *args, &_)
      Rails.logger.warn { "#{self.class.name} does not respond to #{method}(#{args})" }
    end
  end
end
