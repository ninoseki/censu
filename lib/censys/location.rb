# frozen_string_literal: true

module Censys
  class Location
    # @return [String]
    attr_reader :postal_code

    # @return [String]
    attr_reader :city

    # @return [String]
    attr_reader :province

    # @return [String]
    attr_reader :country

    # @return [String]
    attr_reader :continent

    # @return [String]
    attr_reader :registered_country

    # @return [String]
    attr_reader :registered_country_code

    # @return [String]
    attr_reader :timezone

    # @return [Float]
    attr_reader :latitude

    # @return [Float]
    attr_reader :longitude

    #
    # Initializes the location information.
    #
    # @param [Hash{String => Object}] attributes
    #
    def initialize(attributes)
      @attributes = attributes

      @postal_code = self['postal_code']
      @city        = self['city']
      @province    = self['province']
      @country     = self['country']
      @continent   = self['continent']
      @registered_country      = self['registered_country']
      @registered_country_code = self['registered_country_code']
      @timezone = self['timezone']
      @latitude  = self['latitude']
      @longitude = self['longitude']
    end

    private

    def [](key)
      @attributes[key] || @attributes["location.#{key}"]
    end
  end
end
