#####################################################################
# test_system_info.rb
#
# Test case for the Windows::SystemInfo module.
#####################################################################
require 'windows/system_info'
require 'test/unit'

class TC_Windows_SystemInfo < Test::Unit::TestCase
  include Windows::SystemInfo

  def test_system_info_numeric_constants
    assert_equal(386, PROCESSOR_INTEL_386)
    assert_equal(486, PROCESSOR_INTEL_486)
    assert_equal(586, PROCESSOR_INTEL_PENTIUM)
    assert_equal(2200, PROCESSOR_INTEL_IA64)
    assert_equal(8664, PROCESSOR_AMD_X8664)
  end

  def test_system_info_functions_defined
    assert_respond_to(self, :ExpandEnvironmentStringsA)
    assert_respond_to(self, :ExpandEnvironmentStringsW)
    assert_respond_to(self, :GetComputerNameA)
    assert_respond_to(self, :GetComputerNameW)
    assert_respond_to(self, :GetComputerNameExA)
    assert_respond_to(self, :GetComputerNameExW)
    assert_respond_to(self, :GetSystemInfo)
  end

  def test_system_info_boolean_methods
    assert(self.respond_to?(:windows_2000?, true))
    assert(self.respond_to?(:windows_xp?, true))
    assert(self.respond_to?(:windows_2003?, true))
    assert(self.respond_to?(:windows_vista?, true))
  end
end
