#####################################################################
# test_debug.rb
#
# Test case for the Windows::Debug module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/debug'
require 'test/unit'

class TC_Windows_Debug < Test::Unit::TestCase
  include Windows::Debug

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end
   
  def test_debug_functions_defined
    assert_respond_to(self, :ContinueDebugEvent)
    assert_respond_to(self, :DebugActiveProcess)
    assert_respond_to(self, :DebugBreak)
    assert_respond_to(self, :FatalExit)
    assert_respond_to(self, :FlushInstructionCache)
    assert_respond_to(self, :GetThreadContext)
    assert_respond_to(self, :GetThreadSelectorEntry)
    assert_respond_to(self, :IsDebuggerPresent)
    assert_respond_to(self, :OutputDebugStringA)
    assert_respond_to(self, :OutputDebugStringW)
    assert_respond_to(self, :ReadProcessMemory)
    assert_respond_to(self, :SetThreadContext)
    assert_respond_to(self, :WaitForDebugEvent)
    assert_respond_to(self, :WriteProcessMemory)
  end

  def test_debug_functions_defined_on_xp_or_later
    omit_if(@@version < 5.1, "debug function tests skipped on Windows 2000")
    assert_respond_to(self, :CheckRemoteDebuggerPresent)
    assert_respond_to(self, :DebugActiveProcessStop)
    assert_respond_to(self, :DebugBreakProcess)
    assert_respond_to(self, :DebugSetProcessKillOnExit)
  end

  def shutdown
    @@version = nil
  end
end
