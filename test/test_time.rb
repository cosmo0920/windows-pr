#####################################################################
# test_time.rb
#
# Test case for the Windows::Time module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/time'
require 'test/unit'

class TC_Windows_Time < Test::Unit::TestCase
  include Windows::Time

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end

  def test_time_constant_values
    assert_equal(0, TIME_ZONE_ID_UNKNOWN)
    assert_equal(1, TIME_ZONE_ID_STANDARD)
    assert_equal(2, TIME_ZONE_ID_DAYLIGHT)
  end
   
  def test_time_functions_defined
    assert_respond_to(self, :CompareFileTime)
    assert_respond_to(self, :GetLocalTime)
    assert_respond_to(self, :GetTimeFormatA)
    assert_respond_to(self, :GetTimeFormatW)
    assert_respond_to(self, :SetSystemTime)
  end

  def test_time_functions_winxp_or_later
    omit_if(@@version < 5.1, "time function tests skipped on Win2k or earlier")
    assert_respond_to(self, :GetSystemTimes)
  end

  def self.shutdown
    @@version = nil
  end
end
