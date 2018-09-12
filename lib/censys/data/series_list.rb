# frozen_string_literal: true

module Censys
  module Data
    class SeriesList
      attr_reader :primary_series
      attr_reader :raw_series

      def initialize(attributes)
        @primary_series = attributes["primary_series"]
        @raw_series = attributes["raw_series"]
      end
    end
  end
end
