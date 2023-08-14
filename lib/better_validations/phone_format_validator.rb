require "active_model"
require "phony_rails"

# Validates phone number using phony_rails
class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    plausible_number_opts = options[:plausible_number_opts] || {}
    allow_nil = options[:allow_nil] || false

    return if allow_nil && value.nil?
    return if PhonyRails.plausible_number?(value, plausible_number_opts)

    record.errors.add(attribute, options[:message] || "is not a valid phone number")
  end
end
