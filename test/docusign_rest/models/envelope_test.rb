require 'helper'

describe DocusignRest::Envelope do
  describe 'validation' do
    let(:envelope) { build :envelope }

    it 'has a valid factory' do
      envelope.must_be :valid?
    end

    it 'fails if envelopeId is missing' do
      envelope.envelopeId = nil
      envelope.wont_be :valid?
    end

    it 'fails if uri is missing' do
      envelope.uri= nil
      envelope.wont_be :valid?
    end

    it 'fails if statusDateTime is missing' do
      envelope.statusDateTime = nil
      envelope.wont_be :valid?
    end

    it 'fails if status is missing' do
      envelope.status = nil
      envelope.wont_be :valid?
    end
  end
end