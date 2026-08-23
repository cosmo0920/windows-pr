#####################################################################
# tc_msvcrt_time.rb
#
# Test case for the Windows::MSVCRT::Time module.
#####################################################################
require 'windows/msvcrt/time'
require 'minitest/autorun'

# Temporarily disabled: including Windows::MSVCRT::Time defines time(), which
# conflicts with Minitest's internal test-duration accessor in a shared runner.
#
# class TC_Windows_MSVCRT_Time < MiniTest::Test
#   include Windows::MSVCRT::Time
#
#   def test_method_constants
#     assert_not_nil(Asctime)
#   end
#
#   def test_asctime
#     assert(self.respond_to?(:asctime, true))
#   end
# end
