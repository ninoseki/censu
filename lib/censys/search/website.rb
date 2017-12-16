require 'censys/search/result'

module Censys
  module Search
    class Website < Result
      def domain
        @attributes['domain']
      end

      def alexa_rank
        @attributes['alexa_rank']
      end

      alias to_s domain
      alias to_str domain
    end
  end
end
