#####################################################################
# test_limits.rb
#
# Test case for the Windows::Limits module.
#####################################################################
require 'windows/limits'
require 'test/unit'

class TC_Windows_Limits < Test::Unit::TestCase
  include Windows::Limits
  
  def test_limits_numeric_constants
    assert_equal(0x80, MINCHAR)
    assert_equal(0x7f, MAXCHAR)
    assert_equal(0x8000, MINSHORT)
    assert_equal(0x7fff, MAXSHORT)
    assert_equal(0x80000000, MINLONG)
    assert_equal(0x7fffffff, MAXLONG)
    assert_equal(0xff, MAXBYTE)
    assert_equal(0xffff, MAXWORD)
    assert_equal(0xffffffff, MAXDWORD)
  end
end
