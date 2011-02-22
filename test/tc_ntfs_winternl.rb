#####################################################################
# test_ntfs_winternl.rb
#
# Test case for the Windows::NTFS::Winternl module.
#####################################################################
require "windows/ntfs/winternl"
require "test/unit"

class WinternlFoo
end

class TC_Windows_NTFS_Winternl < Test::Unit::TestCase
  include Windows::NTFS::Winternl

  def setup
    @name = "winternl_test.txt"
    @handle = File.open(@name, 'w')
  end
   
  def test_numeric_constants
    assert_equal(8, FileAccessInformation)
  end
  
  def test_methods_defined
    assert_respond_to(self, :NtQueryInformationFile)
  end

  def test_get_final_path_name_by_handle
    assert_respond_to(self, :GetFinalPathNameByHandle)
  end

  def teardown
    @handle.close if @handle
    File.delete(@name) if File.exists?(@name)
  end
end
