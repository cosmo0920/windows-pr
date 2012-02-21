#####################################################################
# test_wsa.rb
#
# Test case for the Windows::WSA module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require 'windows/wsa'

class TC_Windows_WSA < Test::Unit::TestCase
  include Windows::WSA

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_wsa_constants
    assert_equal(1, WSA_FLAG_OVERLAPPED)
  end

  def test_wsa_functions
    assert_respond_to(self, :WSAAccept)
    assert_respond_to(self, :WSARecvEx)
  end

  def test_wsa_functions_xp_or_later
    omit_if(@@version < 5.1, "wsa test skipped on Win2k or earlier")
    assert_respond_to(self, :WSANSPIoctl) 
    assert_respond_to(self, :WSAEnumNameSpaceProvidersA)
    assert_respond_to(self, :WSAEnumNameSpaceProvidersW)
    assert_respond_to(self, :WSAImpersonateSocketPeer)
  end

  def test_wsa_functions_vista_or_later
    omit_if(@@version < 6.0, "wsa test skipped on WinXP or earlier")
    assert_respond_to(self, :WSAConnectByList)
    assert_respond_to(self, :WSARevertImpersonation)
  end

  def self.shutdown
    @@version = nil
  end
end
