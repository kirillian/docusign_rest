module DocusignRest
  class OAuthTicket < Request

    def body
      "grant_type=password&client_id=#{@integrator_key}&username=#{@email}&password=#{@password}&scope=api"
    end

    def uri
      '/oauth2/token'
    end

    def account_related?
      false
    end

    private

    def initialize(integrator_key, email, password)
      @integrator_key = integrator_key
      @email = email
      @password = password

      options[:headers]['Content-Type']= 'application/x-www-form-urlencoded'
      options[:method]= :post
    end
  end
end