FactoryGirl.define do
  factory :docusign_signer, :class => DocusignRest::Signer do
    skip_create
    name 'BroSigner'
    email 'bro@example.com'
    roleName 'investor'
    recipientId 1
  end

  factory :docusign_email, :class => DocusignRest::Email do
    skip_create
    subject 'subject'
    body 'body'
  end

  factory :docusign_envelope_from_template_request, :class => DocusignRest::EnvelopeFromTemplateRequest do
    skip_create
    association :email, :factory =>  :docusign_email
    template_id '5C662120-09F0-4A9B-98D2-E8E099038A4F'

    after(:build) do |request|
      composite_template = DocusignRest::CompositeTemplate.new ['5C662120-09F0-4A9B-98D2-E8E099038A4F'], [build(:docusign_signer)] ,  1

      request.compositeTemplates << composite_template
    end
  end

  factory :envelope, :class => DocusignRest::Envelope do
    envelopeId 'envelopeId'
    uri 'uri'
    statusDateTime DateTime.now
    status 'sent'
  end

  factory :save_document_to_temp_file_request,:class => DocusignRest::SaveDocumentToTempFileRequest do
    envelope_id '5C662120-09F0-4A9B-98D2-E8E099038A4F'
    document_id 'document_id'
    temp_file_path 'temp_file_path'
  end

  factory :recipients_delete_request, :class => DocusignRest::RecipientsDeleteRequest do
    envelopeId '5C662120-09F0-4A9B-98D2-E8E099038A4F'
    recipientId '1'
  end

  factory :tab_add_request , :class => DocusignRest::TabAddRequest do
    envelopeId '5C662120-09F0-4A9B-98D2-E8E099038A4F'
    recipientId '1'
    tab_container
  end

  factory :tab_container, :class => DocusignRest::TabContainer do
    skip_create
    initialize_with { new({}) }
  end

  factory :recipients_get_request, :class => DocusignRest::RecipientsGetRequest do
    envelopeId '5C662120-09F0-4A9B-98D2-E8E099038A4F'
  end

  factory :recipents_add_request, :class => DocusignRest::RecipientsAddRequest do
    envelopeId '5C662120-09F0-4A9B-98D2-E8E099038A4F'

    after(:build) do |request|
      request << build(:docusign_signer)
    end
  end

end