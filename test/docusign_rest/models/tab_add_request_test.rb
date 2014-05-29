require 'helper'

describe DocusignRest::TabAddRequest do
  describe '#initialize' do
    let(:request){ build :tab_add_request }
    it 'sets method to post' do
      request.method.must_equal :post
    end
  end

  describe 'validation' do
    let(:request){ build :tab_add_request }
    it 'has a valid factory' do
      request.must_be :valid?
    end

    it 'fails if envelopeId is nil' do
      request.envelopeId = nil
      request.wont_be :valid?
    end

    it 'fails if recipientId is nil' do
      request.recipientId = nil
      request.wont_be :valid?
    end

    it 'fails if tab_container is nil' do
      request.tab_container = nil
      request.wont_be :valid?
    end

  end
end