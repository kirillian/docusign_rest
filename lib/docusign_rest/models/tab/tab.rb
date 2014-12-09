module DocusignRest
  class Tab < Model

    def method_missing(method, *args, &_)
      Rails.logger.warn { "#{self.class.name} does not respond to #{method}(#{args})" }
    end

    hash_attr *(%i(
            tabId
            anchorString
            anchorXOffset
            anchorYOffset
            anchorIgnoreIfNotPresent
            anchorUnits
            conditionalParentLabel
            conditionalParentValue
            documentId
            pageNumber
            recipientId
            templateLocked
            templateRequired
            xPosition
            yPosition
            name
            tabLabel))
  end
end
