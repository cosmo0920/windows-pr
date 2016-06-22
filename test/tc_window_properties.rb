#####################################################################
# tc_window_properties.rb
#
# Test case for the Windows::Window::Properties module.
#####################################################################
require 'windows/window/properties'
require 'minitest/autorun'

class WindowPropertiesFoo
   include Windows::Window::Properties
end

class TC_Windows_Window_Properties < MiniTest::Test
   def setup
      @foo = WindowPropertiesFoo.new
   end

   def test_method_constants
      assert_not_nil(WindowPropertiesFoo::EnumProps)
   end

   def test_method_mixin
      assert_respond_to(@foo, :EnumProps)
   end

   def teardown
      @foo = nil
   end
end
