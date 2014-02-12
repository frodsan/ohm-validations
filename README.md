ohm-validations
===============

Validations for Ohm::Model.

Usage
-----

```
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

  def before_validation
    @before = true
  end

  def after_validation
    @after = true
  end
end

user = User.new({})
user.valid? # => false

user.update_attributes(name: "jhon", email: "jhon@doe.com")
user.valid? # => true

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
