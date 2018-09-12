# frozen_string_literal: true

module Censys
  class ResponseError < StandardError; end

  class AuthenticationError < ResponseError; end

  class NotFound < ResponseError; end

  class RateLimited < ResponseError; end

  class InternalServerError < ResponseError; end
end
