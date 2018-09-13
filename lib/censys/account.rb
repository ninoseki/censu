# frozen_string_literal: true

require 'censys/account/quota'

module Censys
  class Account
    attr_reader :api_id
    attr_reader :email
    attr_reader :first_login
    attr_reader :last_login
    attr_reader :login
    attr_reader :quota

    def initialize(attributes)
      @api_id       = attributes["api_id"]
      @email        = attributes["email"]
      @first_login  = attributes["first_login"]
      @last_login   = attributes["last_login"]
      @login        = attributes["login"]
      @quota        = Quota.new(attributes["quota"])
    end
  end
end
