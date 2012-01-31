#####################################################################
# test_nio.rb
#
# Test case for the Windows::NIO module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/nio'
require 'test/unit'

class TC_Windows_NIO < Test::Unit::TestCase
  include Windows::NIO

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end

  def test_nio_constants
    assert_equal(0, OF_READ)
    assert_equal(1, OF_WRITE)
    assert_equal(2, OF_READWRITE)
  end
   
  def test_nio_functions_defined
    assert_respond_to(self, :CancelIo)
    assert_respond_to(self, :ReadFileScatter)
  end

  def test_nio_functions_defined_vista_or_later
    msg = "nio functions skipped on Windows XP or earlier"
    omit_if(@@version < 6.0, msg)
    assert_respond_to(self, :CancelIoEx)
  end

  def self.shutdown
    @@version = nil
  end
end
