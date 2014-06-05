require_relative 'custom_field'

module DocusignRest
  class ListCustomField < CustomField
    validates_presence_of :listItems
  end
end