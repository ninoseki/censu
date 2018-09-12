# frozen_string_literal: true

require 'time'

module Censys
  module Data
    class Result
      attr_reader :id
      attr_reader :files
      attr_reader :timestamp

      def initialize(attributes)
        @id = attributes["id"]
        @files = attributes["files"]
        @timestamp = Time.parse(attributes["timestamp"])
      end
    end
  end
end
