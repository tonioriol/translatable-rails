# Translatable
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'translatable-rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install translatable-rails
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Roadmap
* Make it DB agnostic, currently only Postgres is tested. But probably works out of the box with MySQL.
* Add test for MySQL. (Sqlite is not possible since doesnt have json fields? Or maybe using text field with json in it)
* Add methods for migrations. To be able to define translatable fields in migrations.
* Review Ruby and Rails minimum required version and lower it as much as possible.
* Remove sensitive info from config.