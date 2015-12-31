require "bundler/setup"
require "minitest/autorun"
require "minitest/pride"
require "minitest/sugar"
require "ohm"
require "ohm/contrib"
require_relative "../lib/ohm/validations"

Ohm.redis = Redic.new("redis://127.0.0.1:6379/15")

class User < Ohm::Model
  include Ohm::Validations

  attribute :name

  attr :before, :after

  def validate
    assert_present(:name)
  end

  protected

  def before_validate
    @before = true
  end

  def after_validate
    @after = true
  end
end

class Person < Ohm::Model
  include Ohm::Callbacks
  include Ohm::Validations

  attribute :name

  attr :did_before_validate
  attr :did_before_create
  attr :did_after_validate
  attr :did_after_create

  protected

  def validate
    assert_present(:name)
  end

  def before_validate; @did_before_validate = true end
  def before_create; @did_before_create = true; end
  def after_validate; @did_after_validate = true end
  def after_create; @did_after_create = true; end
end

class ValidationsTest < Minitest::Test
  setup do
    Ohm.flush
  end


  test "validations" do
    user = User.new

    assert !user.valid?

    user.name = "jhon"

    assert user.valid?
  end

  test "callbacks" do
    user = User.new({})

    user.valid?

    assert user.before
    assert user.after
  end

  test "save" do
    assert User.create.nil?

    user = User.new
    assert user.save.nil?

    user.name = "jhon"
    user.save

    assert user.id

    assert user.update(name: "").nil?
    assert user.update(name: "jhon")
  end

  test "compatibility" do
    person = Person.new

    assert !person.valid?

    assert person.did_before_validate
    assert person.did_after_validate
    assert !person.did_before_create
    assert !person.did_after_create

    person = Person.create(name: "jhon")

    assert person.did_before_validate
    assert person.did_after_validate
    assert person.did_before_create
    assert person.did_after_create
  end
end
