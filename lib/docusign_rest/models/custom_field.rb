module DocusignRest
  class CustomField < Model

  hash_attr :fieldId, :name, :required, :show, :value, :listItems

  validates_presence_of :fieldId, :name, :required, :show, :value
  end
end
