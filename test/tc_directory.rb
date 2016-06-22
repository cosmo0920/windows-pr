#####################################################################
# tc_directory.rb
#
# Test case for the Windows::Directory module.
#####################################################################
require 'windows/directory'
require 'minitest/autorun'

class DirectoryFoo
   include Windows::Directory
end

class TC_Windows_Directory < MiniTest::Test
   def setup
      @foo  = DirectoryFoo.new
   end

   def test_method_constants
      assert_not_nil(DirectoryFoo::CreateDirectory)
   end

   def teardown
      @foo  = nil
   end
end
