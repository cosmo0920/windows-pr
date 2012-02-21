#####################################################################
# test_window_classes.rb
#
# Test case for the Windows::Window::Classes module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require 'windows/window/classes'

class TC_Windows_Window_Classes < Test::Unit::TestCase
  include Windows::Window::Classes

  def test_window_classes_constants
    assert_equal(-8, GCL_MENUNAME)
  end
   
  def test_window_classes_functions_defined
    assert_respond_to(self, :GetClassInfoA)
    assert_respond_to(self, :GetClassInfoW)
  end

  def test_for_64_bit_functions
    omit_unless(-1.size == 8, "test skipped except on 64-bit architectures")
    assert_respond_to(self, :GetWindowLongPtr)
  end
end
