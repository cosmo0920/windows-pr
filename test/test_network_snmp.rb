#####################################################################
# test_network_snmp.rb
#
# Test case for the Windows::Network::SNMP module.
#####################################################################
require 'windows/network/snmp'
require 'test-unit'

class TC_Windows_Network_SNMP < Test::Unit::TestCase
  include Windows::Network::SNMP

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_network_snmp_constants
    assert_equal(0, SNMPAPI_FAILURE)
    assert_equal(1, SNMPAPI_SUCCESS)
  end

  def test_network_snmp_functions_defined
    assert_respond_to(self, :SnmpCancelMsg)
    assert_respond_to(self, :SnmpCleanup)
    assert_respond_to(self, :SnmpClose)
  end

  def test_network_snmp_functions_win2k3_or_later
    omit_unless(@@version >= 6.0, "Tests skipped except on Win2k3 and later")
    assert_respond_to(self, :SnmpCreateSession)
  end

  def self.shutdown
    @@version = nil
  end
end
