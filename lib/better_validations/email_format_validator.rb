require "active_model"
require "uri"

# require "pry"
#
# Validates email format using ruby's email regexp
class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    validator_proc = options[:check_with] || default_validator_proc
    allow_nil = options[:allow_nil] || false

    return if allow_nil && value.nil?

    result = validator_proc.call(value)
    return unless result.nil? || !result

    record.errors.add(attribute, options[:message] || "is not a valid email")
  end

  private

  def default_validator_proc
    proc { |email| email =~ URI::MailTo::EMAIL_REGEXP }
  end
end
