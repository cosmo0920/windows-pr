#####################################################################
# tc_handle.rb
#
# Test case for the Windows::Handle module.
#####################################################################
require 'windows/handle'
require 'minitest/autorun'

class HandleFoo
  include Windows::Handle
end

class TC_Windows_Handle < MiniTest::Test
   def setup
      @foo = HandleFoo.new
   end

   def x64?
      ['a'].pack('P').length > 4
   end

   def test_numeric_constants
      if x64?
         assert_equal(0xFFFFFFFFFFFFFFFF, HandleFoo::INVALID_HANDLE_VALUE)
      else
         assert_equal(0xFFFFFFFF, HandleFoo::INVALID_HANDLE_VALUE)
      end
      assert_equal(0x00000001, HandleFoo::HANDLE_FLAG_INHERIT)
      assert_equal(0x00000002, HandleFoo::HANDLE_FLAG_PROTECT_FROM_CLOSE)
   end

   def test_method_constants
      assert_not_nil(HandleFoo::CloseHandle)
      assert_not_nil(HandleFoo::DuplicateHandle)
      assert_not_nil(HandleFoo::GetHandleInformation)
      assert_not_nil(HandleFoo::Get_osfhandle)
      assert_not_nil(HandleFoo::Open_osfhandle)
   end

   def teardown
      @foo = nil
   end
end
