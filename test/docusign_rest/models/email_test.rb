require 'helper'

describe DocusignRest::Email do
  describe 'validation' do
    let(:email) { build :docusign_email}

    it 'has a valid factory' do
      email.must_be :valid?
    end

    it 'fails if no subject' do
      email.subject = nil
      email.wont_be :valid?
    end

    it 'fails if no body' do
      email.body = nil
      email.wont_be :valid?
    end
  end
end