#####################################################################
# test_filesystem.rb
#
# Test case for the Windows::FileSystem module.
#####################################################################
require 'windows/filesystem'
require 'test/unit'

class TC_Windows_FileSystem < Test::Unit::TestCase
  include Windows::FileSystem
   
  def test_filesytem_functions_defined
    assert_respond_to(self, :GetDiskFreeSpaceA)
    assert_respond_to(self, :GetDiskFreeSpaceW)
    assert_respond_to(self, :GetDiskFreeSpaceExA)
    assert_respond_to(self, :GetDiskFreeSpaceExW)
  end
end
