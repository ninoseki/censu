module Censys
  class Document
    module HasServices
      #
      # Open ports.
      #
      # @return [Hash{String => Hash}]
      #
      def ports
        @ports ||= Hash[@attributes.select { |key, _| key =~ /\A\d+\z/ }]
      end

      #
      # @return [Array<String>]
      #
      def protocols
        @attributes['protocols']
      end
    end
  end
end
