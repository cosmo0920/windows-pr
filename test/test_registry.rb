#####################################################################
# test_registry.rb
#
# Test case for the Windows::Registry module.
#####################################################################
require 'windows/registry'
require 'test-unit'

class TC_Windows_Registry < Test::Unit::TestCase
  include Windows::Registry

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_registry_constants
    assert_equal(0x80000000, HKEY_CLASSES_ROOT)
  end

  def test_registry_functions_defined
    assert_respond_to(self, :RegCloseKey)
    assert_respond_to(self, :RegConnectRegistryA)
    assert_respond_to(self, :RegConnectRegistryW)
    assert_respond_to(self, :RegCreateKeyA)
    assert_respond_to(self, :RegCreateKeyW)
  end

  def test_registry_functions_defined_xp_or_later
    assert_respond_to(self, :RegGetValueA)
    assert_respond_to(self, :RegGetValueW)
  end

  def test_registry_functions_defined_vista_or_later
    assert_respond_to(self, :RegDeleteKeyExA)
    assert_respond_to(self, :RegDeleteKeyExW)
    assert_respond_to(self, :GetSystemRegistryQuota)
  end

  def self.shutdown
    @@version = nil
  end
end
