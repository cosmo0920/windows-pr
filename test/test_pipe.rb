#####################################################################
# test_pipe.rb
#
# Test case for the Windows::Pipe module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/pipe'
require 'test/unit'

class TC_Windows_Pipe < Test::Unit::TestCase
  include Windows::Pipe

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end
   
  def test_pipe_constants
    assert_equal(0x00000001, NMPWAIT_NOWAIT)
    assert_equal(0xffffffff, NMPWAIT_WAIT_FOREVER)
    assert_equal(0x00000000, NMPWAIT_USE_DEFAULT_WAIT)
    assert_equal(0x00000000, PIPE_WAIT)
    assert_equal(0x00000001, PIPE_NOWAIT)
    assert_equal(0x00000001, PIPE_ACCESS_INBOUND)
    assert_equal(0x00000002, PIPE_ACCESS_OUTBOUND)
    assert_equal(0x00000003, PIPE_ACCESS_DUPLEX)
    assert_equal(0x00000000, PIPE_TYPE_BYTE)
    assert_equal(0x00000004, PIPE_TYPE_MESSAGE)
    assert_equal(0x00000000, PIPE_READMODE_BYTE)
    assert_equal(0x00000002, PIPE_READMODE_MESSAGE)
    assert_equal(0x00000000, PIPE_CLIENT_END)
    assert_equal(0x00000001, PIPE_SERVER_END)
  end
 
  def test_pipe_functions
    assert_respond_to(self, :CallNamedPipeA)
    assert_respond_to(self, :CallNamedPipeW)
    assert_respond_to(self, :ConnectNamedPipe)
    assert_respond_to(self, :CreateNamedPipeA)
    assert_respond_to(self, :CreateNamedPipeW)
    assert_respond_to(self, :CreatePipe)
    assert_respond_to(self, :DisconnectNamedPipe)
    assert_respond_to(self, :GetNamedPipeHandleStateA)
    assert_respond_to(self, :GetNamedPipeHandleStateW)
    assert_respond_to(self, :GetNamedPipeInfo)
    assert_respond_to(self, :PeekNamedPipe)
    assert_respond_to(self, :SetNamedPipeHandleState)
    assert_respond_to(self, :TransactNamedPipe)
    assert_respond_to(self, :WaitNamedPipeA)
    assert_respond_to(self, :WaitNamedPipeW)
  end

  def test_pipe_functions_vista_or_later
    assert_respond_to(self, :GetNamedPipeClientProcessId)
  end

  def self.shutdown
    @@version = `ver`.chomp[/\d.\d/].to_f
  end
end
