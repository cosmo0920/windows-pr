#####################################################################
# tc_socket.rb
#
# Test case for the Windows::Socket module.
#####################################################################
require 'windows/socket'
require 'minitest/autorun'

class SocketFoo
  include Windows::Socket
end

class TC_Windows_Socket < MiniTest::Test
  def setup
    @socket = SocketFoo.new
  end

  def test_methods
    assert_respond_to(@socket, :accept)
    assert_respond_to(@socket, :AcceptEx)
  end

  def test_constants
    assert_equal(0, SocketFoo::IPPROTO_IP)
  end

  def teardown
    @socket = nil
  end
end
