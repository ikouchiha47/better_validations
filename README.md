# BetterValidations

Although rails has validation with ActiveModel::Validations, there are a couple of boiler plate validations that
needs to be done while building web applications, most of the time.

For example, `email validation`, `phone number validation` etc.

Although there are solutions that are available, either it requires multiple gems or 
user relies on QA from stackoverflow or other forums of sorts.

BetterValidations is a gem that provides a set of enhanced custom validators for use in your rails all.

These custom validators offer additional functionality beyond the built-in Rails validators, allowing you to perform complex validations with ease.BetterValidations is a gem that provides a set of enhanced custom validators for use in your Rails applications. These custom validators offer additional functionality beyond the built-in Rails validators, allowing you to perform complex validations with ease.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'better_validations', git: 'https://github.com/ikouchiha47/better_validations.git'
```

or, you can use the bundler to do
```
bundle add better_validations --git=https://github.com/ikouchiha47/better_validations.git

```  

## Usage

#### Email format validator

```ruby
class User < ApplicationRecord
    validates :email, email_format: true
end
```

or

```ruby
class User < ApplicationRecord
    validates :email, email_format: { check_with: ->(email) { custom_email_validator(email) } }

    private

    def default_validator_proc
        proc { |email| email =~ URI::MailTo::EMAIL_REGEXP }
    end
end
```

You can also pass `{ allow_nil: true }`, to skip if its nil. 


#### Phone number format validator.

uses `phony_rails` to run this validation. This accepts whatever options [PhonyRails.plausible_number?](https://github.com/joost/phony_rails/blob/v0.15.0/lib/phony_rails.rb#L117) takes as arguments.



## Supported validators

- `email_format: true`
- `email_format: { check_with: Proc.new, allow_nil: false }`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ikouchiha47/better_validations 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
