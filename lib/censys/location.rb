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
    attr_reader :country_code

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

      @city                     = self['city']
      @continent                = self['continent']
      @country                  = self['country']
      @country_code             = self['country_code']
      @latitude                 = self['latitude']
      @longitude                = self['longitude']
      @postal_code              = self['postal_code']
      @province                 = self['province']
      @registered_country       = self['registered_country']
      @registered_country_code  = self['registered_country_code']
      @timezone                 = self['timezone']
    end

    private

    def [](key)
      @attributes[key] || @attributes["location.#{key}"]
    end
  end
end
