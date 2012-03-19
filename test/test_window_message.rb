#####################################################################
# test_window_message.rb
#
# Test case for the Windows::Window::Message module.
#####################################################################
require 'windows/window/message'
require 'test-unit'

class TC_Windows_Window_Message < Test::Unit::TestCase
  include Windows::Window::Message

  test "expected numeric constants are defined" do
    assert_equal(5, WM_SIZE)
  end

  test "window message functions are defined at expected" do
    assert_respond_to(self, :PeekMessageA)
    assert_respond_to(self, :PeekMessageW)
    assert_respond_to(self, :PostMessageA)
    assert_respond_to(self, :PostMessageW)
  end
end
