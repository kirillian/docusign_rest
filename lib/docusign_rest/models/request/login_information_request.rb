module DocusignRest
  # Returns:
  #   accountId - For the username, password, and integrator_key specified
  #   baseUrl   - The base URL for all future DocuSign requests
  #   email     - The email used when signing up for DocuSign
  #   isDefault - # TODO identify what this is
  #   name      - The account name provided when signing up for DocuSign
  #   userId    - # TODO determine what this is used for, if anything
  #   userName  - Full name provided when signing up for DocuSign
  class LoginInformationRequest < Request
    def uri
      '/login_information'
    end

    def account_related?
      false
    end
  end
end