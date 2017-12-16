require 'censys/search/result'

module Censys
  module Search
    class IPv4 < Result

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
