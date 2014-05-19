module DocusignRest
  class ListCustomField < CustomField
    validates_presence_of :listItems
  end
end