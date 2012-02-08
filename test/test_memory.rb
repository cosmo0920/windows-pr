#####################################################################
# test_memory.rb
#
# Test case for the Windows::Memory module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/memory'
require 'test/unit'

class TC_Windows_Memory < Test::Unit::TestCase
  include Windows::Memory

  def test_memory_constants_defined
    assert_not_nil(GHND)
    assert_not_nil(GMEM_FIXED)
    assert_not_nil(GMEM_MOVABLE)
    assert_not_nil(GMEM_ZEROINIT)
    assert_not_nil(GPTR)
  end

  def test_memory_functions_defined
    assert_respond_to(self, :GlobalAlloc)
    assert_respond_to(self, :GlobalFlags)
    assert_respond_to(self, :GlobalFree)
    assert_respond_to(self, :GlobalHandle)
    assert_respond_to(self, :GlobalLock)
    assert_respond_to(self, :GlobalMemoryStatus)
    assert_respond_to(self, :GlobalMemoryStatusEx)
    assert_respond_to(self, :GlobalReAlloc)
    assert_respond_to(self, :GlobalSize)
    assert_respond_to(self, :GlobalUnlock)
  end
end
