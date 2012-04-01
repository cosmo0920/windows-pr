#####################################################################
# test_socket.rb
#
# Test case for the Windows::Socket module.
#####################################################################
require 'windows/socket'
require 'test-unit'

# We need to use an external class because of the send function.
class SocketTest
  include Windows::Socket
end

class TC_Windows_Socket < Test::Unit::TestCase
  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def setup
    @socket = SocketTest.new
  end

  def test_socket_constants
    assert_equal(0, SocketTest::IPPROTO_IP)
  end

  def test_socket_functions_defined
    assert_respond_to(@socket, :accept)
    assert_respond_to(@socket, :AcceptEx)
  end

  def test_socket_functions_xp_or_later
    omit_unless(@@version >= 5.1, "Tests skipped on Windows 2000 or earlier.")
    assert_respond_to(@socket, :freeaddrinfo)
  end

  def shutdown
    @socket = nil
  end

  def self.shutdown
    @@version = nil
  end
end
