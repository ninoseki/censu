require 'censys/search/result'
require 'censys/document/has_location'

module Censys
  module Search
    class IPv4 < Result
      include Censys::Document::HasLocation

      def ip
        @attributes['ip']
      end

      def protocols
        @attributes['protocols']
      end

      alias to_s ip
      alias to_str ip
    end
  end
end
