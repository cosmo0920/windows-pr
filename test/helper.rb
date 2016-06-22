require 'minitest/autorun'
require 'minitest/unit'

module Minitest::Assertions
  def assert_not_nil(*args)
    refute_nil(*args)
  end

  def assert_nothing_raised(*args)
    yield
  end

  alias assert_raise assert_raises
end
