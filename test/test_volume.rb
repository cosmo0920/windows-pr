#####################################################################
# test_volume.rb
#
# Test case for the Windows::Volume module.
#####################################################################
require 'windows/volume'
require 'test/unit'

class TC_Windows_Volume < Test::Unit::TestCase
  include Windows::Volume

  def test_constants
    assert_equal(0, DRIVE_UNKNOWN)
    assert_equal(1, DRIVE_NO_ROOT_DIR)
    assert_equal(2, DRIVE_REMOVABLE)
    assert_equal(3, DRIVE_FIXED)
    assert_equal(4, DRIVE_REMOTE)
    assert_equal(5, DRIVE_CDROM)
    assert_equal(6, DRIVE_RAMDISK)
  end

  def test_method_constants
    assert_respond_to(self, :DefineDosDeviceA)
    assert_respond_to(self, :DefineDosDeviceW)
    assert_respond_to(self, :DeleteVolumeMountPointA)
    assert_respond_to(self, :DeleteVolumeMountPointW)
    assert_respond_to(self, :FindFirstVolumeA)
    assert_respond_to(self, :FindFirstVolumeW)
    assert_respond_to(self, :FindFirstVolumeMountPointA)
    assert_respond_to(self, :FindFirstVolumeMountPointW)
    assert_respond_to(self, :FindNextVolumeA)
    assert_respond_to(self, :FindNextVolumeW)
    assert_respond_to(self, :FindNextVolumeMountPointA)
    assert_respond_to(self, :FindNextVolumeMountPointW)
    assert_respond_to(self, :FindVolumeClose)
    assert_respond_to(self, :FindVolumeMountPointClose)
    assert_respond_to(self, :GetDriveTypeA)
    assert_respond_to(self, :GetDriveTypeW)
    assert_respond_to(self, :GetLogicalDrives)
    assert_respond_to(self, :GetLogicalDriveStringsA)
    assert_respond_to(self, :GetLogicalDriveStringsW)
    assert_respond_to(self, :GetVolumeInformationA)
    assert_respond_to(self, :GetVolumeInformationW)
    assert_respond_to(self, :GetVolumeNameForVolumeMountPointA)
    assert_respond_to(self, :GetVolumeNameForVolumeMountPointW)
    assert_respond_to(self, :GetVolumePathNameA)
    assert_respond_to(self, :GetVolumePathNameW)
    assert_respond_to(self, :QueryDosDeviceA)
    assert_respond_to(self, :QueryDosDeviceW)
    assert_respond_to(self, :SetVolumeLabelA)
    assert_respond_to(self, :SetVolumeLabelW)
    assert_respond_to(self, :SetVolumeMountPointA)
    assert_respond_to(self, :SetVolumeMountPointW)
  end

  def test_get_volume_type
    assert_nothing_raised{ get_volume_type }
    assert_kind_of(String, get_volume_type)
  end
end
