#####################################################################
# test_shell.rb
#
# Test case for the Windows::Shell module.
#####################################################################
require 'windows/shell'
require 'test-unit'

class TC_Windows_Shell < Test::Unit::TestCase
  include Windows::Shell

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_shell_constants
    assert_equal(0, CSIDL_DESKTOP)
    assert_equal(1, CSIDL_INTERNET)
    assert_equal(2, CSIDL_PROGRAMS)
  end

  def test_shell_functions_defined
    assert_respond_to(self, :ShellExecuteA)
    assert_respond_to(self, :ShellExecuteW)
    assert_respond_to(self, :SHGetFolderPathA)
    assert_respond_to(self, :SHGetFolderPathW)
  end

  def test_shell_functions_vista_or_later
    omit_unless(@@version >= 6.0, "Tests skipped on XP or earlier")
    assert_respond_to(self, :SHGetKnownFolderPath)
  end

  def self.shutdown
    @@version = nil
  end
end
