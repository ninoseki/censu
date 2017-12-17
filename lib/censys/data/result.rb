require 'time'

module Censys
  module Data
    class Result
      attr_reader :id

      attr_reader :files

      def initialize(attributes)
        @id = attributes["id"]
        @files = attributes["files"]
      end

      def timestamp
        @timestamp ||= Time.parse(attributes["timestamp"])
      end
    end
  end
end