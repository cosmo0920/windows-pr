#####################################################################
# test_file_mapping.rb
#
# Test case for the Windows::FileMapping module.
#####################################################################
require 'windows/file_mapping'
require 'test/unit'

class TC_Windows_FileMapping < Test::Unit::TestCase
  include Windows::FileMapping

  def test_file_mapping_constants
    assert_equal(0x00000001, FILE_MAP_COPY)
    assert_equal(0x00000002, FILE_MAP_WRITE)
    assert_equal(0x00000004, FILE_MAP_READ)
    assert_equal(983071, FILE_MAP_ALL_ACCESS)
  end
   
  def test_file_mapping_functions_defined
    assert_respond_to(self, :CreateFileMappingA)
    assert_respond_to(self, :CreateFileMappingW)
    assert_respond_to(self, :GetMappedFileNameA)
    assert_respond_to(self, :GetMappedFileNameW)
    assert_respond_to(self, :FlushViewOfFile)
    assert_respond_to(self, :MapViewOfFile)
    assert_respond_to(self, :MapViewOfFileEx)
    assert_respond_to(self, :OpenFileMappingA)
    assert_respond_to(self, :OpenFileMappingW)
    assert_respond_to(self, :UnmapViewOfFile)
  end
end
