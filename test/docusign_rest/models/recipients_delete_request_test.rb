require 'helper'

describe DocusignRest::RecipientsDeleteRequest do
  describe 'initialize' do
    let(:request){ build :recipients_delete_request }
    it 'set method to delete' do
      request.method.must_be :delete
    end
  end

  describe 'validation' do
    let(:request){ build :recipients_delete_request }
    it 'has a valid factory' do
      request.must_be :valid?
    end

    it 'fails if no recipientId' do
      request.recipientId = nil
      request.wont_be :valid?
    end

    it 'fails if no envelopeId' do
      request.envelopeId = nil
      request.wont_be :valid?
    end
  end

  describe 'body' do
    let(:request){ build :recipients_delete_request }

    it 'returns a string' do
      request.body.must_be_instance_of String
    end

    it 'returns a valid json string' do
      JSON.parse(request.body).to_json.must_equal request.body
    end
  end
end