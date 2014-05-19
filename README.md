#DocusignRestSm

This project was forked from [DocusignRest](https://github.com/jondkinney/docusign_rest)

##Significance

The goal of this project is to add a layer of validation prior to sending a request and to implement missing features.

##Progress

- Added dependency to 'activemodel' in order to validate a request before sending it to Docusign
- Added 'save_document_to_temp_file' function not to store the request body in memory before writing the file. Uses a temporary file.
- Added the ability to set what encoding the file will be written with
- Added Composite Template support
- Added Envelope Recipient Get Request
- Added Envelope Recipient Tabs Get Request

##Installation

Add this line to your application's Gemfile:

    gem 'docusign_rest_sm', :git =>'https://github.com/secondmarket/docusign_rest.git'

And then execute:

    $ bundle

##Usage

###Creating an Envelope from a Template

    email = DocusignRest::Email.new :subject => 'subject', :body => 'body'
    request = DocusignRest::EnvelopeFromTemplateRequest.new :email => email
    signer = DocusignRest::Signer.new :name => 'name', :email => 'email', :roleName => 'role'

    template_ids.each_with_index do |template_id, index|
      request.compositeTemplates << DocusignRest::CompositeTemplate.new([template_id], [signer] , index + 1)
    end

    envelope = DocusignRest::Client.new.create_envelope_from_template_request request


###Getting Recipient View for an Envelope

    signer = DocusignRest::Signer.new :name => 'name', :email => 'email', :roleName => 'role'
    envelope = DocusignRest::Envelope.new :envelopeId => 'envelope_id', :uri => 'uri', :statusDateTime => 'status_date_time', :status => 'status'

    url = DocusignRest::Client.new.get_recipient_view_request(DocusignRest::RecipientViewRequest.new(:signer => signer, :envelope => envelope, :return_url => 'return_url'))

##Validation

If the request is not valid, an exception is raised with the errors hash in the message.

    Exception: request invalid: {:email=>["is invalid"], :envelope_id=>["Invalid Format"]}


