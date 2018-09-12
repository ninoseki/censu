# frozen_string_literal: true

module Censys
  class Document
    #
    # Initializes the document.
    #
    # @param [Hash{String => Object}] attributes
    #
    def initialize(attributes)
      @attributes = attributes
    end

    #
    # Provides arbitrary access to the attributes
    #
    # @param [String] name
    #   The dot-separated field name.
    #
    # @return [Object]
    #
    def [](name)
      keys = name.split(".")
      dig(*keys)
    end

    #
    # Dig attributes
    #
    # @param [Array<String>] keys
    #
    # @return [Object]
    #
    def dig(*keys)
      @attributes.dig(*keys)
    end

    #
    # Tags.
    #
    # @return [Array<String>]
    #
    def tags
      @attributes['tags']
    end

    #
    # Time last updated at.
    #
    # @return [Time]
    #
    def updated_at
      @updated_at ||= Time.parse(@attributes['updated_at'])
    end

    #
    # Additional document metadata.
    #
    # @return [Hash{String => Object}]
    #
    def metadata
      @attributes['metadata']
    end
  end
end
