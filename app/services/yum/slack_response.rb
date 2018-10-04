module Yum
  class SlackResponse
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def call(payload)
      RestClient::Request.execute(method: :post, url: @url,
                                  payload: payload.to_json)
    end
  end
end
