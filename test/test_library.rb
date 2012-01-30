#####################################################################
# test_library.rb
#
# Test case for the Windows::Library module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/library'
require 'test/unit'

class TC_Windows_Library < Test::Unit::TestCase
  include Windows::Library

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end

  def test_library_constant_values
    assert_equal(0, DLL_PROCESS_DETACH)
    assert_equal(1, DLL_PROCESS_ATTACH)
    assert_equal(2, DLL_THREAD_ATTACH)
    assert_equal(3, DLL_THREAD_DETACH)
  end

  def test_library_functions_defined
    assert_respond_to(self, :FreeLibrary)
    assert_respond_to(self, :GetModuleFileNameA)
    assert_respond_to(self, :GetModuleFileNameW)
    assert_respond_to(self, :GetModuleHandleA)
    assert_respond_to(self, :GetModuleHandleW)
    assert_respond_to(self, :LoadLibraryA)
    assert_respond_to(self, :LoadLibraryW)
    assert_respond_to(self, :LoadLibraryExA)
    assert_respond_to(self, :LoadLibraryExW)
    assert_respond_to(self, :LoadModule)
  end

  def test_library_functions_winxp_or_later
    omit_if(@@version < 5.1, "library tests skipped on Win2k or earlier")
    assert_respond_to(self, :GetDllDirectoryA)
    assert_respond_to(self, :GetDllDirectoryW)
    assert_respond_to(self, :SetDllDirectoryA)
    assert_respond_to(self, :SetDllDirectoryW)
  end

  def self.shutdown
    @@version = nil
  end
end
