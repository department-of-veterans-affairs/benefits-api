require 'net/http'
require 'httparty'


# Monkey patch to allow leave headers in lowercase, as required by EVSS services
module Net::HTTPHeader
  def capitalize(name)
    name
  end
  private :capitalize
end

module EVSS

  class ClaimsService
    include HTTParty

    # TODO: Get base URI from env
    base_uri 'http://csraciapp6.evss.srarad.com:7003/wss-claims-services-web-3.1/rest'

    def initialize(user_info={})
      @headers = user_info
    end

    def claims()
      self.class.get('/vbaClaimStatusService/getOpenClaims',
        headers: @headers
      )
    end

    def create_intent_to_file!()
      headers = {
         'Content-Type': 'application/json',
      }
      headers.merge!(@headers)

      self.class.post('/claimServicesExternalService/listAllIntentToFile',
        headers: headers,
        body: '{}'
      )
    end
  end
end
