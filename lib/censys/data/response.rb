# frozen_string_literal: true

require 'censys/data/result'
require 'censys/data/series_list'
require 'censys/data/series'

module Censys
  module Data
    class Response
      RESULTS = {
        series_list: SeriesList,
        series:      Series,
        result:      Result
      }.freeze

      def initialize(result_type, response)
        unless (result_class = RESULTS[result_type])
          raise(ArgumentError, "invalid result type: #{result_type}")
        end

        result_class.new(response)
      end
    end
  end
end
