#####################################################################
# test_com_automation.rb
#
# Test case for the Windows::COM::Automation module.
#####################################################################
require 'windows/com/automation'
require 'test/unit'

class TC_Windows_COM_Automation < Test::Unit::TestCase
  include Windows::COM::Automation

  def test_com_automation_functions_defined
    assert_respond_to(self, :BstrFromVector)
    assert_respond_to(self, :CreateErrorInfo)
    assert_respond_to(self, :CreateTypeLib2)
  end

  def test_com_automation_constants
    assert_equal(0, REGKIND_DEFAULT)
    assert_equal(1, REGKIND_REGISTER)
    assert_equal(2, REGKIND_NONE)
  end
end
