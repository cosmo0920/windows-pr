#####################################################################
# test_ntfs_winternl.rb
#
# Test case for the Windows::NTFS::Winternl module.
#####################################################################
require 'windows/handle'
require 'windows/ntfs/winternl'
require 'windows/error'
require 'minitest/autorun'

class TC_Windows_NTFS_Winternl < MiniTest::Test
  include Windows::Handle
  include Windows::NTFS::Winternl
  include Windows::Error

  def setup
    @name = "winternl_test.txt"
    @handle = File.open(@name, 'w')
  end

  def test_numeric_constants
    assert_equal(8, FileAccessInformation)
  end

  def test_methods_defined
    assert(self.respond_to?(:NtQueryInformationFile, true))
  end

  def test_get_final_path_name_by_handle
    assert(self.respond_to?(:GetFinalPathNameByHandle, true))
  end

  def test_get_final_path_name_by_handle_returns_expected_result
    buf = 0.chr * 260
    res = nil
    hdl = get_osfhandle(@handle.fileno)

    assert_nothing_raised{ res = GetFinalPathNameByHandle(hdl, buf, buf.size, 2) }
    assert_kind_of(Fixnum, res)
    assert_equal(@name, File.basename(buf.strip))
  end

  def teardown
    @handle.close if @handle
    File.delete(@name) if File.exist?(@name)
    @name = nil
  end
end
