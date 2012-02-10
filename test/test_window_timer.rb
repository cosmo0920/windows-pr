#####################################################################
# test_window_timer.rb
#
# Test case for the Windows::Window::Timer module.
#####################################################################
require 'windows/window/timer'
require 'test/unit'

class TC_Windows_Window_Timer < Test::Unit::TestCase
  include Windows::Window::Timer

  def test_window_timer_functions_defined
    assert_respond_to(self, :KillTimer)
    assert_respond_to(self, :SetTimer)
  end
end
