# ExchangeRate

Foreign currency exchange library.

Example Ruby on Rails application repository:

https://github.com/Serapke/ExchangeRateApp

## Usage

Create new rate instances:
```ruby
ExchangeRate::Rate.instance.set(currency, rate, date)
```

Get rates from database:
```ruby
ExchangeRate::Rate.instance.get(currency, date)
```

Convert currency using:
```ruby
ExchangeRate::Rate.instance.at(date, from, to)
```

To access ActiveRecord class of Rate use class:
```ruby
ExchangeRate::Record
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'exchange_rate',
    :git => 'https://github.com/Serapke/ExchangeRate.git' 
```

And then execute:
```bash
$ bundle
```

After that:
```bash
$ rails g exchange_rate:install
```

This will create a new migration `create_rates`

Do a migration:

```bash
$ rails db:migrate
```

And you are good to go!

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
