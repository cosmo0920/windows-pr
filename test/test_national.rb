#####################################################################
# test_national.rb
#
# Test case for the Windows::National module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/national'
require 'test/unit'

class TC_Windows_National < Test::Unit::TestCase
  include Windows::National

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end

  def test_national_numeric_constants
    assert_equal(2048, LANG_SYSTEM_DEFAULT)
    assert_equal(1024, LANG_USER_DEFAULT)
    assert_equal(2048, LOCALE_SYSTEM_DEFAULT)
    assert_equal(1024, LOCALE_USER_DEFAULT)
    assert_equal(8323072, LOCALE_INVARIANT)
  end
   
  def test_national_functions_defined
    assert_respond_to(self, :GetACP)
    assert_respond_to(self, :GetDateFormatA)
    assert_respond_to(self, :GetLocaleInfoA)
    assert_respond_to(self, :GetSystemDefaultLangID)
    assert_respond_to(self, :GetUserDefaultLangID)
    assert_respond_to(self, :GetUserDefaultLCID)
  end

  def test_national_functions_vista_or_later
    omit_if(@@version < 6.0, "skipping national test on XP and earlier")
    assert_respond_to(self, :AdjustCalendarDate)
    assert_respond_to(self, :EnumTimeFormatsEx)
    assert_respond_to(self, :GetCurrencyFormatEx)
    assert_respond_to(self, :GetDateFormatEx)
  end

  def self.teardown
    @@version = nil
  end
end
