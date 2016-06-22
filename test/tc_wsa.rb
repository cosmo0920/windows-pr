#####################################################################
# tc_wsa.rb
#
# Test case for the Windows::WSA module.
#####################################################################
require 'windows/wsa'
require 'minitest/autorun'

class TC_Windows_WSA < MiniTest::Test
  include Windows::WSA

  def test_methods
    assert_respond_to(self, :WSAAccept)
  end

  def test_constants
    assert_equal(1, WSA_FLAG_OVERLAPPED)
  end
end
