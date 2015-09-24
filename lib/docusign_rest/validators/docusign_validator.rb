class DocusignValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t(:invalid_format) unless value =~ /^[a-f0-9-]{36}$/i
  end
end
