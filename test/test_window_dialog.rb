#####################################################################
# test_window_dialog.rb
#
# Test case for the Windows::Window::Dialog module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/window/dialog'
require 'test/unit'

class TC_Windows_Window_Dialog < Test::Unit::TestCase
  include Windows::Window::Dialog

  def test_window_dialog_constants
    assert_equal(0, MB_OK)
  end
   
  def test_window_dialog_functions_defined
    assert_respond_to(self, :MessageBoxA)
    assert_respond_to(self, :MessageBoxW)
  end
end
