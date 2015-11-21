# hconfig

hconfig translates ENV vars into `Config.*` attributes, with presence
validation and type casting. hconfig is intended to be used in
environments (Heroku, in my case) where much of the config is stored in ENV.

hconfig is a standalone gem version of the `CastingConfigHelpers` module from
[Pliny](https://github.com/interagent/pliny).

## Installation

```ruby
gem 'hconfig'
```

## Usage

```ruby
module Config
  extend HConfig

  mandatory :database_url, string
  optional  :versioning_default, string
  override  :port, 5000, int
end

ENV["DATABASE_URL"] = "postgres:///thing-db"

Config.database_url
# => "postgres:///thing-db"
```

### RbConfig Note

If you're mixing this into a module named `Config`, RbConfig will warn you 
about doing so. You can supress the warning via:

```ruby
Object.send(:remove_const, :Config) if Object.const_defined?(:Config)
```

Alternatively, you can just namespace `Config` under your app/lib/etc.

### Mandatory Variables

An exception is raised when the ENV var is missing.

```ruby
mandatory :database_url, string
```

### Optional Variables

The value is returned if set, otherwise `nil`.

```ruby
optional :versioning_default, string
```

### Override

The value is returned if set, otherwise the default value will be
returned.

```ruby
override :port, 5000, int
```

## Development

```
$ bundle install
$ rake
```

