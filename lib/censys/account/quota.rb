# frozen_string_literal: true

module Censys
  class Account
    class Quota
      attr_reader :used
      attr_reader :resets_at
      attr_reader :allowance

      def initialize(attributes)
        @used       = attributes["used"]
        @resets_at  = attributes["resets_at"]
        @allowance  = attributes["allowance"]
      end
    end
  end
end
