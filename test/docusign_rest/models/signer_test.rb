require 'helper'

describe DocusignRest::Signer do
  describe 'validation' do
    let(:signer) { build :docusign_signer }
    it 'has a valid factory' do
      signer.must_be :valid?
    end

    it 'fails if embedded is nil' do
      signer.embedded = nil
      signer.wont_be :valid?
    end

    it 'fails if name is nil' do
      signer.name = nil
      signer.wont_be :valid?
    end

    it 'fails if email is nil' do
      signer.email = nil
      signer.wont_be :valid?
    end

    it 'fails if role_name is nil' do
      signer.roleName = nil
      signer.wont_be :valid?
    end
  end

  describe '#initialize' do
    it 'defaults embedded to true' do
      DocusignRest::Signer.new.embedded.must_equal 'true'
    end
  end
end