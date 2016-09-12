# twelvefactor-cache

Adds support for CACHE_URL environment variable in a way similar to
[http://edgeguides.rubyonrails.org/configuring.html](DATABASE_URL).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twelvefactor-cache'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twelvefactor-cache

## Usage

1. Add `CACHE_URL` to your application environment.

```
CACHE_URL=dalli://my.host:11211
CACHE_URL=file:///tmp/rails/cache
```

2. Remove old cache configuration code (`config.cache_store`)
from `application.rb` and `ENV.rb`

### Supported caching methods

dalli
(requires [dalli](https://github.com/petergoldstein/dalli))

```
dalli://first.host,second.host?expires_in=120&namespace=myapp&compress=true
```

file

```
file:///tmp/cache
```

null
```
null://localhost
```

redis
```
redis://localhost:6379/1/cache
```

## Development

After checking out the repo, run `bin/setup` to install
dependencies. Then, run `rake spec` to run the tests. You can also run
`bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake
install`.  To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will
create a git tag for the version, push git commits and tags, and push
the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/bkon/twelvefactor-cache.  This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
