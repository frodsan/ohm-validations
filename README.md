ohm-validations [![Build Status](https://travis-ci.org/frodsan/ohm-validations.svg)](https://travis-ci.org/frodsan/ohm-validations)
===============

Validations for Ohm::Model.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem "ohm-validations"
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install ohm-validations
```

Usage
-----

```ruby
class User < Ohm::Model
  include Ohm::Validations

  attribute :name
  attribute :email

  attr_reader :before, :after

  protected

  def validate
    assert_present(:name)
    assert_email(:email)
  end

  def before_validate
    @before = true
  end

  def after_validate
    @after = true
  end
end

User.create
# => nil

user = User.new
user.valid? # => false

user.update_attributes(name: "jhon", email: "jhon@doe.com")
user.valid? # => true
user.save   # => user

user.before # => true
user.after  # => true
```

Check [scrivener][scrivener] project for more information
about the available validations.

Contributing
------------

Fork the project with:

```
$ git clone git@github.com:frodsan/ohm-validations.git
```

To install dependencies, use:

```
$ bundle install
```

To run the test suite, do:

```
$ rake test
```

For bug reports and pull requests use [GitHub][issues].

License
-------

This gem is released under the [MIT License][mit].

[mit]: http://www.opensource.org/licenses/MIT
[issues]: https://github.com/frodsan/ohm-validations/issues
[scrivener]: https://github.com/soveran/scrivener
