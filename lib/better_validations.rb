# frozen_string_literal: true

require_relative "better_validations/version"

require_relative "better_validations/country_code_format_validator"
require_relative "better_validations/email_format_validator"
require_relative "better_validations/phone_format_validator"

module BetterValidations
  class Error < StandardError; end
  # Your code goes here...
end

require "better_validations"
