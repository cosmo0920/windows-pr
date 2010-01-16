#####################################################################
# tc_process.rb
#
# Test case for the Windows::Process module.
#####################################################################
require 'windows/process'
require 'test/unit'

class TC_Windows_Process < Test::Unit::TestCase
   include Windows::Process

   def test_constants
      assert_equal(0x1F0FFF, PROCESS_ALL_ACCESS)
   end

   def test_methods
      assert_respond_to(self, :CreateProcess)
   end

   def test_helper_methods
      assert_respond_to(self, :windows_64?)
      assert_equal(true, [true, false].include?(windows_64?))
   end
end
