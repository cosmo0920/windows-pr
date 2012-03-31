#####################################################################
# test_file.rb
#
# Test case for the Windows::File module.
#####################################################################
require 'windows/file'
require 'test-unit'

class TC_Windows_File < Test::Unit::TestCase
  include Windows::File

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
    @@is64 = ENV['ProgramW6432'] == ENV['ProgramFiles']
  end

  def test_numeric_constants
    assert_equal(0x00000001, FILE_ATTRIBUTE_READONLY)
    assert_equal(0x00000002, FILE_ATTRIBUTE_HIDDEN)
    assert_equal(0x00000004, FILE_ATTRIBUTE_SYSTEM)
    assert_equal(0x00000010, FILE_ATTRIBUTE_DIRECTORY)
    assert_equal(0x00000020, FILE_ATTRIBUTE_ARCHIVE)
    assert_equal(0x00000040, FILE_ATTRIBUTE_ENCRYPTED)
    assert_equal(0x00000080, FILE_ATTRIBUTE_NORMAL)
    assert_equal(0x00000100, FILE_ATTRIBUTE_TEMPORARY)
    assert_equal(0x00000200, FILE_ATTRIBUTE_SPARSE_FILE)
    assert_equal(0x00000400, FILE_ATTRIBUTE_REPARSE_POINT)
    assert_equal(0x00000800, FILE_ATTRIBUTE_COMPRESSED)
    assert_equal(0x00001000, FILE_ATTRIBUTE_OFFLINE)
    assert_equal(0x00002000, FILE_ATTRIBUTE_NOT_CONTENT_INDEXED)
  end

  def test_file_functions_defined
    assert_respond_to(self, :CopyFileA)
    assert_respond_to(self, :CopyFileW)
    assert_respond_to(self, :CopyFileExA)
    assert_respond_to(self, :CopyFileExW)
    assert_respond_to(self, :CreateFileA)
    assert_respond_to(self, :CreateFileW)
    assert_respond_to(self, :CreateHardLinkA)
    assert_respond_to(self, :CreateHardLinkW)
    assert_respond_to(self, :DecryptFileA)
    assert_respond_to(self, :DecryptFileW)
    assert_respond_to(self, :DeleteFileA)
    assert_respond_to(self, :DeleteFileW)
    assert_respond_to(self, :EncryptFileA)
    assert_respond_to(self, :EncryptFileW)
    assert_respond_to(self, :GetBinaryTypeA)
    assert_respond_to(self, :GetBinaryTypeW)
    assert_respond_to(self, :GetFileAttributesA)
    assert_respond_to(self, :GetFileAttributesW)
    assert_respond_to(self, :GetFileAttributesExA)
    assert_respond_to(self, :GetFileAttributesExW)
    assert_respond_to(self, :GetFileSize)
    assert_respond_to(self, :GetFileSizeEx)
    assert_respond_to(self, :GetFileType)
    assert_respond_to(self, :GetFullPathNameA)
    assert_respond_to(self, :GetFullPathNameW)
    assert_respond_to(self, :GetLongPathNameA)
    assert_respond_to(self, :GetLongPathNameW)
    assert_respond_to(self, :GetShortPathNameA)
    assert_respond_to(self, :GetShortPathNameW)
    assert_respond_to(self, :LockFile)
    assert_respond_to(self, :LockFileEx)
    assert_respond_to(self, :ReadFile)
    assert_respond_to(self, :ReadFileEx)
    assert_respond_to(self, :SetFileAttributesA)
    assert_respond_to(self, :SetFileAttributesW)
    assert_respond_to(self, :UnlockFile)
    assert_respond_to(self, :UnlockFileEx)
    assert_respond_to(self, :WriteFile)
    assert_respond_to(self, :WriteFileEx)
  end

  def test_file_functions_xp_or_later
    omit_if(@@version < 5.1, "Tests skipped on Windows 2000")
    assert_respond_to(self, :SetFileShortNameA)
    assert_respond_to(self, :SetFileShortNameW)
  end

  def test_file_functions_xp64_or_later
    omit_unless(@@version >= 5.1, "Tests skipped except on XP or later")
    omit_if(@@version == 5.1 && !@@is64, "Tests skipped on 32 bit Windows XP")

    assert_respond_to(self, :Wow64DisableWow64FsRedirection)
    assert_respond_to(self, :Wow64EnableWow64FsRedirection)
    assert_respond_to(self, :Wow64RevertWow64FsRedirection)
  end

  def test_file_functions_vista_or_later
    omit_if(@@version < 6.0, "Tests skipped on XP or earlier")
    assert_respond_to(self, :CreateSymbolicLinkA)
    assert_respond_to(self, :CreateSymbolicLinkW)
    assert_respond_to(self, :GetFinalPathNameByHandleA)
    assert_respond_to(self, :GetFinalPathNameByHandleW)
  end

  def self.shutdown
    @@version = nil
    @@is64 = nil
  end
end
