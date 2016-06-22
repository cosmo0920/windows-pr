#####################################################################
# tc_filesystem.rb
#
# Test case for the Windows::FileSystem module.
#####################################################################
require 'windows/filesystem'
require 'minitest/autorun'

class FileSystemFoo
  include Windows::FileSystem
end

class TC_Windows_FileSystem < MiniTest::Test

   def setup
      @foo = FileSystemFoo.new
   end

   def test_method_constants
      assert_not_nil(FileSystemFoo::GetDiskFreeSpace)
      assert_not_nil(FileSystemFoo::GetDiskFreeSpaceEx)
   end

   def teardown
      @foo = nil
   end
end
