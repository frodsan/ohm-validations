ohm-validations
===============

Validations for Ohm::Model.

Usage
-----

```ruby
class User < Ohm::Model
  include Ohm::Validations

  attribute :name
  attribute :email

  attr :before, :after

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

Installation
------------

```
$ gem install ohm-validations
```

[scrivener]: https://github.com/soveran/scrivener
