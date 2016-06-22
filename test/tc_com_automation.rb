#####################################################################
# tc_com_automation.rb
#
# Test case for the Windows::COM::Automation module.
#####################################################################
require 'windows/com/automation'
require 'minitest/autorun'

class TC_Windows_COM_Automation < MiniTest::Test
   include Windows::COM::Automation

   def test_method_constants
      assert_respond_to(self, :BstrFromVector)
   end
end
