module DocusignRest
  class Tab < Model
    hash_attr %i(anchorString
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
            yPosition)
  end
end