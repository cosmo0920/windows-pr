#####################################################################
# test_ntfs_winternl.rb
#
# Test case for the Windows::NTFS::Winternl module.
#####################################################################
require "windows/ntfs/winternl"
require "test/unit"

class WinternlFoo
   include Windows::NTFS::Winternl
end

class TC_Windows_NTFS_Winternl < Test::Unit::TestCase
   def setup
      @foo = WinternlFoo.new
   end
   
   def test_numeric_constants
      assert_equal(8, WinternlFoo::FileAccessInformation)
   end
   
   def test_method_constants
      assert_not_nil(WinternlFoo::NtQueryInformationFile)
   end
   
   def teardown
      @foo = nil
   end
end
