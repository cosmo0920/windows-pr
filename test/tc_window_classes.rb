#####################################################################
# tc_window_classes.rb
#
# Test case for the Windows::Window::Classes module.
#####################################################################
require 'windows/window/classes'
require 'minitest/autorun'

class WindowClassesFoo
   include Windows::Window::Classes
end

class TC_Windows_Window_Classes < MiniTest::Test
   def setup
      @foo = WindowClassesFoo.new
   end

   def test_numeric_constants
      assert_equal(-8, WindowClassesFoo::GCL_MENUNAME)
   end

   def test_method_constants
      assert_not_nil(WindowClassesFoo::GetClassInfo)
   end

   def test_method_mixin
      assert_respond_to(@foo, :GetClassInfo)
   end

   def teardown
      @foo = nil
   end
end
