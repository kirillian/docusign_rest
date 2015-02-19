module DocusignRest
  class Tab < Model

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
