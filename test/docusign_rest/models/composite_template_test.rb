require 'helper'

describe DocusignRest::CompositeTemplate do
  describe 'validation' do
    it 'fails if there is no template' do
      template = DocusignRest::CompositeTemplate.new nil, [build(:docusign_signer)], 1

      template.wont_be :valid?
    end

    it 'fails if there is no signer' do
      template = DocusignRest::CompositeTemplate.new ['5C662120-09F0-4A9B-98D2-E8E099038A4F'], nil, 1

      template.wont_be :valid?
    end
  end
end