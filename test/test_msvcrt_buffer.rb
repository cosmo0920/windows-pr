#####################################################################
# test_msvcrt_buffer.rb
#
# Test case for the Windows::MSVCRT::Buffer module.
#####################################################################
require 'windows/msvcrt/buffer'
require 'test/unit'

class TC_Windows_MSVCRT_Buffer < Test::Unit::TestCase
  include Windows::MSVCRT::Buffer

  def test_msvcrt_buffer_functions_defined
    assert_respond_to(self, :memcpy)
    assert_respond_to(self, :memchr)
    assert_respond_to(self, :memset)
  end
end
