# frozen_string_literal: true

require 'censys/http_response'

module Censys
  class Document
    module HasHTTPResponse
      #
      # HTTP reponse information.
      #
      # @return [HTTPResponse]
      #
      def http_response
        @http_response ||= HTTPResponse.new(@attributes.dig("80", "http"))
      end
    end
  end
end
