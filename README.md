# Twinkle::Client

A ruby client for Twinkle notification service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twinkle-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twinkle-client

## Usage

#### Basic configuration
```ruby
Twinkle::Client.configure do |config|
  config.endpoint = "http://example.com"
  config.token = "hex-digest-user-token"
end
```

#### Sending a message

```ruby
Twinkle::Client.create_message("deploy", "Release!")

Twinkle::Client.create_message("sadness", exception)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bibendi/twinkle-client.
