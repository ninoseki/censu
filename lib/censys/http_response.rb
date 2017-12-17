module Censys
  class HTTPResponse
    def initialize(attributes)
      @attributes = attributes
    end

    def body
      @attributes.dig("get", "body")
    end

    def header
      @attributes.dig("get", "headers")
    end

    def status_code
      @attributes.dig("get", "status_code")
    end

    def title
      @attributes.dig("get", "title")
    end
  end
end
