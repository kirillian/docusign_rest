require 'helper'

describe DocusignRest::RecipientsAddRequest do
  describe 'initialize' do
    let(:request){ build :recipents_add_request }
    it 'set method to post' do
      request.method.must_equal :post
    end

    it 'defaults resend_envelope to true' do
      request.resend_envelope.must_equal true
    end
  end
  describe 'validation' do
    let(:request) { build :recipents_add_request }

    it 'has a valid factory' do
      request.must_be :valid?
    end

    it 'fails if signers is nil' do
      request.signers = nil
      request.wont_be :valid?
    end

    it 'fails if signers is empty' do
      request.signers = []
      request.wont_be :valid?
    end

    it 'fails if a signer is invalid' do
      request.signers[0].name = nil
      request.wont_be :valid?
    end
  end
end