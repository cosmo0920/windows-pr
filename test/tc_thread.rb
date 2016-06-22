#####################################################################
# tc_thread.rb
#
# Test case for the Windows::Thread module.
#####################################################################
require 'windows/thread'
require 'minitest/autorun'

class ThreadFoo
   include Windows::Thread
end

class TC_Windows_Thread < MiniTest::Test
   def setup
      @foo  = ThreadFoo.new
   end

   def test_numeric_constants
      assert_equal(0x00100000, ThreadFoo::SYNCHRONIZE)
   end

   def test_method_constants
      assert_not_nil(ThreadFoo::CreateThread)
   end

   def teardown
      @foo  = nil
   end
end
