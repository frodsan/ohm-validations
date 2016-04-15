require "bundler/setup"
require "minitest/autorun"
require "minitest/pride"
require "minitest/sugar"
require "ohm"
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
end
