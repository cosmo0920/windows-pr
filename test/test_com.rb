#####################################################################
# test_com.rb
#
# Test case for the Windows::COM module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/com'
require 'test/unit'

class TC_Windows_COM < Test::Unit::TestCase
  include Windows::COM

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_com_constant_values
    assert_equal(0, VT_EMPTY)
    assert_equal(1, VT_NULL)
    assert_equal(2, VT_I2)
    assert_equal(3, VT_I4)
    assert_equal(4, VT_R4)
  end

  def test_com_functions_defined
    assert_respond_to(self, :BindMoniker)
    assert_respond_to(self, :CLSIDFromProgID)
    assert_respond_to(self, :CLSIDFromProgIDEx)
    assert_respond_to(self, :CoAddRefServerProcess)
    assert_respond_to(self, :CoAllowSetForegroundWindow)
    assert_respond_to(self, :CoCancelCall)
    assert_respond_to(self, :CoCopyProxy)
    assert_respond_to(self, :CoCreateFreeThreadedMarshaler)
    assert_respond_to(self, :CoCreateGuid)
    assert_respond_to(self, :CoCreateInstance)
  end

  def test_com_functions_vista_or_later
    msg = 'com test skipped on XP or earlier'
    omit_if(@@version < 6.0, msg)
    assert_respond_to(self, :CoDisconnectContext)
  end

  def self.shutdown
    @@version = nil
  end
end
