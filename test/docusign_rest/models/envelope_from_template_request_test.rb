require 'helper'

describe DocusignRest::EnvelopeFromTemplateRequest do
  describe 'validation' do
    let(:request) { build :docusign_envelope_from_template_request }

    it 'has a valid factory' do
      request.must_be :valid?
    end

    it 'fails if no status' do
      request.status = nil
      request.wont_be :valid?
    end

    it 'fails if no email' do
      request.email = nil
      request.wont_be :valid?
    end

    it 'fails if no compositeTemplates' do
      request.compositeTemplates= []
      request.wont_be :valid?
    end
  end
end