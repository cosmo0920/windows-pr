#####################################################################
# test_com_accessibility.rb
#
# Test case for the Windows::COM::Accessibility module.
#####################################################################
require 'windows/com/accessibility'
require 'test/unit'

class TC_Windows_COM_Accessibility < Test::Unit::TestCase
  include Windows::COM::Accessibility

  def test_methods_defined
    assert_respond_to(self, :ObjectFromLresult)
  end
end
