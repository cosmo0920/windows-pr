#####################################################################
# test_directory.rb
#
# Test case for the Windows::Directory module.
#####################################################################
require 'windows/directory'
require 'test/unit'

class TC_Windows_Directory < Test::Unit::TestCase
  include Windows::Directory

  def test_directory_functions_defined
    assert_respond_to(self, :CreateDirectoryA)
    assert_respond_to(self, :CreateDirectoryW)
    assert_respond_to(self, :CreateDirectoryExA)
    assert_respond_to(self, :CreateDirectoryExW)
    assert_respond_to(self, :GetCurrentDirectoryA)
    assert_respond_to(self, :GetCurrentDirectoryW)
    assert_respond_to(self, :SetCurrentDirectoryA)
    assert_respond_to(self, :SetCurrentDirectoryW)
  end
end
