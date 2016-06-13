#####################################################################
# tc_window_timer.rb
#
# Test case for the Windows::Window::Timer module.
#####################################################################
require 'windows/window/timer'
require 'minitest/unit'

class WindowTimerFoo
   include Windows::Window::Timer
end

class TC_Windows_Window_Timer < MiniTest::Test
   def setup
      @foo = WindowTimerFoo.new
   end

   def test_method_constants
      assert_not_nil(WindowTimerFoo::KillTimer)
   end

   def test_method_mixin
      assert_respond_to(@foo, :KillTimer)
   end

   def teardown
      @foo = nil
   end
end
