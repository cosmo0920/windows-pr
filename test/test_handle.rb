#####################################################################
# test_handle.rb
#
# Test case for the Windows::Handle module.
#####################################################################
require 'windows/handle'
require 'test/unit'

class TC_Windows_Handle < Test::Unit::TestCase
  include Windows::Handle

  def test_handle_functions_defined
    assert_respond_to(self, :CloseHandle)
    assert_respond_to(self, :DuplicateHandle)
    assert_respond_to(self, :GetHandleInformation)
    assert_respond_to(self, :_get_osfhandle)
    assert_respond_to(self, :_open_osfhandle)
  end

  def test_handle_numeric_constants
    assert_equal(0xFFFFFFFF, INVALID_HANDLE_VALUE)
    assert_equal(0x00000001, HANDLE_FLAG_INHERIT)
    assert_equal(0x00000002, HANDLE_FLAG_PROTECT_FROM_CLOSE)
  end
end
