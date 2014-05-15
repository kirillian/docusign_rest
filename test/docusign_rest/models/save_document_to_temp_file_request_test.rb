require 'helper'

describe DocusignRest::SaveDocumentToTempFileRequest do
  describe 'validation' do
    let(:request) { build :save_document_to_temp_file_request }

    it 'has a valid factory' do
      request.must_be :valid?
    end

    it 'fails if no envelope_id' do
      request.envelope_id = nil
      request.wont_be :valid?
    end

    it 'fails if no document_id' do
      request.document_id = nil
      request.wont_be :valid?
    end

    it 'fails if no temp_file_path' do
      request.temp_file_path = nil
      request.wont_be :valid?
    end

    it 'fails if envelope_id is not a valid docusign id' do
      request.envelope_id = 'invalid'
      request.wont_be :valid?
    end
  end
end