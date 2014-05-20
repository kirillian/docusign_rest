module DocusignRest
  class TextTab < Tab
    hash_attr *(%i(bold
            font
            fontColor
            fontSize
            italic
            underline
            concealValueOnDocument
            disableAutoSize
            locked
            required
            value
            width
            mergeFieldXml
            requireInitialOnSharedChange
            shared
            validationMessage
            validationPattern
            height
            isPaymentAmount))
  end
end