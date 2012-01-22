#####################################################################
# test_device_io.rb
#
# Test case for the Windows::DeviceIO module.
#####################################################################
require 'windows/device_io'
require 'test/unit'

class TC_Windows_DeviceIO < Test::Unit::TestCase
  include Windows::DeviceIO

  def test_device_io_numeric_constants_defined
    assert_equal(0x00000001, FILE_DEVICE_BEEP)
  end

  def test_device_io_functions_defined
    assert_respond_to(self, :DeviceIoControl)
  end
end
