require "active_model"
require "countries"

# Validate country code using countries gem
class CountryCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    allow_nil = options[:allow_nil] || false
    return if allow_nil && value.nil?

    country = ISO3166::Country[value.to_s.upcase]
    return if country

    record.errors.add(attribute, options[:message] || "is not a valid country code")
  end
end
