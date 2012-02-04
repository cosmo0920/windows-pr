#####################################################################
# test_process.rb
#
# Test case for the Windows::Process module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/process'
require 'test/unit'

class TC_Windows_Process < Test::Unit::TestCase
  include Windows::Process

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_process_constants
    assert_equal(0x1F0FFF, PROCESS_ALL_ACCESS)
  end

  def test_process_functions_defined
    assert_respond_to(self, :CreateProcessA)
    assert_respond_to(self, :CreateProcessW)
  end

  def test_process_functions_xp_or_later
    msg = "Process tests skipped on Win2k or earlier"
    omit_if(@@version < 5.1, msg)
    assert_respond_to(self, :GetProcessId)
  end

  def test_process_helper_methods
    assert(self.respond_to?(:windows_64?, true))
    assert_true([true, false].include?(windows_64?))
  end

  def self.shutdown
    @@version = nil
  end
end
