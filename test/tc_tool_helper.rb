#####################################################################
# tc_tool_helper.rb
#
# Test case for the Windows::ToolHelper module.
#####################################################################
require 'windows/tool_helper'
require 'minitest/autorun'

class ToolHelperFoo
   include Windows::ToolHelper
end

class TC_Windows_ToolHelper < MiniTest::Test
   def setup
      @foo  = ToolHelperFoo.new
   end

   def test_numeric_constants
      assert_equal(0x00000001, ToolHelperFoo::TH32CS_SNAPHEAPLIST)
   end

   def test_method_constants
      assert_not_nil(ToolHelperFoo::Process32First)
   end

   def teardown
      @foo  = nil
   end
end
