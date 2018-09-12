# frozen_string_literal: true

require 'censys/location'

module Censys
  class Document
    module HasLocation
      #
      # Location information.
      #
      # @return [Location]
      #
      def location
        @location ||= Location.new(@attributes['location'] || @attributes)
      end
    end
  end
end
