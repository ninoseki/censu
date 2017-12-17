module Censys
  module Data
    class Series
      attr_reader :id

      attr_reader :port

      attr_reader :protocol

      attr_reader :subprotocol

      attr_reader :destination

      attr_reader :name

      attr_reader :description

      attr_reader :results

      def initialize(attributes)
        @id = attributes["id"]
        @port = attributes["port"]
        @protocol = attributes["protocol"]
        @subprotocol = attributes["subprotocol"]
        @destination = attributes["destination"]
        @name = attributes["name"]
        @description = attributes["description"]
        @results = attributes["results"]
      end
    end
  end
end