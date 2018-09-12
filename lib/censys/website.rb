# frozen_string_literal: true

require 'censys/document'
require 'censys/document/has_services'
require 'censys/document/has_location'
require 'censys/document/has_asn'
require 'censys/document/has_http_response'

module Censys
  class Website < Document
    include HasServices
    include HasLocation
    include HasASN
    include HasHTTPResponse

    #
    # @return [String]
    #
    def domain
      @attributes['domain']
    end

    #
    # @return [Fixnum]
    #
    def alexa_rank
      @attributes['alexa_rank']
    end

    def to_s
      domain
    end
  end
end
