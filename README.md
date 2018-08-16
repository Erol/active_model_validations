# Active Model Validations

A collection of additional validators for Active Model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_model_validators'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_model_validators

## Usage

```
class Book < ActiveRecord::Base
  attribute :pages

  validates :pages, minimum: { value: 1, message: 'must contain atleast 1 page' }
  validates :pages, maximum: { value: 1000, message: 'must not exceed 1000 pages' }
end

book = Book.new(pages: 0)
book.valid? #=> false

book = Book.new(pages: 1001)
book.valid? #=> false

book = Book.new(pages: 1)
book.valid? #=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Erol/active_model_validators.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
