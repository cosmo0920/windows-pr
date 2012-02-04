#####################################################################
# test_tool_helper.rb
#
# Test case for the Windows::ToolHelper module.
#####################################################################
require 'windows/tool_helper'
require 'test/unit'

class TC_Windows_ToolHelper < Test::Unit::TestCase
  include Windows::ToolHelper

  def test_numeric_constants
    assert_equal(0x00000001, TH32CS_SNAPHEAPLIST)
  end

  def test_method_constants
    assert_respond_to(self, :Process32First)
  end
end
