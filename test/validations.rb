require "cutest"
require "ohm"
require_relative "../lib/ohm/validations"

Ohm.redis = Redic.new("redis://127.0.0.1:6379/15")

setup do
  Ohm.flush
end

class User < Ohm::Model
  include Ohm::Validations

  attribute :name

  attr :before, :after

  def validate
    assert_present(:name)
  end

  def before_validation
    @before = true
  end

  def after_validation
    @after = true
  end
end

test "validations" do
  user = User.new({})

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
