#####################################################################
# test_thread.rb
#
# Test case for the Windows::Thread module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/thread'
require 'test/unit'

class TC_Windows_Thread < Test::Unit::TestCase
  include Windows::Thread

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_thread_constants
    assert_equal(0x00100000, SYNCHRONIZE)
  end

  def test_thread_functions_defined
    assert_respond_to(self, :CreateThread)
  end

  def test_thread_functions_xp_or_later
    omit_if(@@version < 5.1, "thread test skipped on Win2k or earlier")
    assert_respond_to(self, :AttachThreadInput)
  end

  def self.shutdown
    @@version = nil
  end
end
