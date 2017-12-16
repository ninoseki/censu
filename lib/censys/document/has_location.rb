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
        @location ||= Location.new(@attributes['location'])
      end
    end
  end
end
