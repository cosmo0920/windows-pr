#####################################################################
# test_window_properties.rb
#
# Test case for the Windows::Window::Properties module.
#####################################################################
require 'windows/window/properties'
require 'test-unit'

class TC_Windows_Window_Properties < Test::Unit::TestCase
  include Windows::Window::Properties

  test "window properties functions are defined as expected" do
    assert_respond_to(self, :EnumPropsA)
    assert_respond_to(self, :EnumPropsW)
    assert_respond_to(self, :EnumPropsExA)
    assert_respond_to(self, :EnumPropsExW)
    assert_respond_to(self, :GetPropA)
    assert_respond_to(self, :GetPropW)
    assert_respond_to(self, :RemovePropA)
    assert_respond_to(self, :RemovePropW)
    assert_respond_to(self, :SetPropA)
    assert_respond_to(self, :SetPropW)
  end
end
