module DocusignRest
  class TextTab < Tab
    hash_attr %i(bold
            font
            fontColor
            fontSize
            italic
            tabLabel
            underline
            concealValueOnDocument
            disableAutoSize
            locked
            name
            required
            value
            width
            mergeFieldXml
            requireInitialOnSharedChange
            shared
            validationMessage
            validationPattern
            height
            isPaymentAmount)
  end
end