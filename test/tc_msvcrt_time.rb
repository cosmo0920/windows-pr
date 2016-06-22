#####################################################################
# tc_msvcrt_time.rb
#
# Test case for the Windows::MSVCRT::Time module.
#####################################################################
require 'windows/msvcrt/time'
require 'minitest/autorun'

class TC_Windows_MSVCRT_Time < MiniTest::Test
  include Windows::MSVCRT::Time

  def test_method_constants
    assert_not_nil(Asctime)
  end

  def test_asctime
    assert(self.respond_to?(:asctime, true))
  end
end
