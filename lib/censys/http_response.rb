# frozen_string_literal: true

module Censys
  class HTTPResponse
    #
    # Initializes the HTTP Response infromation
    #
    # @param [Hash{String => Object}] attributes
    #
    def initialize(attributes)
      @attributes = attributes
    end

    #
    # HTTP body
    #
    # @return [String] body
    #
    def body
      @attributes.dig("get", "body")
    end

    #
    # HTTP header
    #
    # @return [Hash] header
    #
    def header
      @attributes.dig("get", "headers")
    end

    #
    # HTTP status code
    #
    # @return [Integer] status code
    #
    def status_code
      @attributes.dig("get", "status_code")
    end

    #
    # HTTP title
    #
    # @return [String] title
    #
    def title
      @attributes.dig("get", "title")
    end
  end
end
