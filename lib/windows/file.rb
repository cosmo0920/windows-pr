require 'windows/unicode'
require 'windows/security'

module Windows
  module File
    include Windows::Unicode
    include Windows::Security
    extend FFI::Library
    ffi_lib :kernel32

    private

    FILE_BEGIN   = 0
    FILE_CURRENT = 1
    FILE_END     = 2

    # File Attributes

    FILE_ATTRIBUTE_READONLY      = 0x00000001
    FILE_ATTRIBUTE_HIDDEN        = 0x00000002
    FILE_ATTRIBUTE_SYSTEM        = 0x00000004
    FILE_ATTRIBUTE_DIRECTORY     = 0x00000010
    FILE_ATTRIBUTE_ARCHIVE       = 0x00000020
    FILE_ATTRIBUTE_ENCRYPTED     = 0x00000040
    FILE_ATTRIBUTE_NORMAL        = 0x00000080
    FILE_ATTRIBUTE_TEMPORARY     = 0x00000100
    FILE_ATTRIBUTE_SPARSE_FILE   = 0x00000200
    FILE_ATTRIBUTE_REPARSE_POINT = 0x00000400
    FILE_ATTRIBUTE_COMPRESSED    = 0x00000800
    FILE_ATTRIBUTE_OFFLINE       = 0x00001000
    FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x00002000

    # File types

    FILE_TYPE_UNKNOWN = 0x0000
    FILE_TYPE_DISK    = 0x0001
    FILE_TYPE_CHAR    = 0x0002
    FILE_TYPE_PIPE    = 0x0003
    FILE_TYPE_REMOTE  = 0x8000

    # File compression constants

    COMPRESSION_FORMAT_NONE      = 0
    COMPRESSION_FORMAT_DEFAULT   = 1
    COMPRESSION_FORMAT_LZNT1     = 2
    COMPRESSION_ENGINE_STANDARD  = 0
    COMPRESSION_ENGINE_MAXIMUM   = 256
    ANYSIZE_ARRAY                = 1

    # File security and access rights

    FILE_READ_DATA               = 1
    FILE_LIST_DIRECTORY          = 1
    FILE_WRITE_DATA              = 2
    FILE_ADD_FILE                = 2
    FILE_APPEND_DATA             = 4
    FILE_ADD_SUBDIRECTORY        = 4
    FILE_CREATE_PIPE_INSTANCE    = 4
    FILE_READ_EA                 = 8
    FILE_READ_PROPERTIES         = 8
    FILE_WRITE_EA                = 16
    FILE_WRITE_PROPERTIES        = 16
    FILE_EXECUTE                 = 32
    FILE_TRAVERSE                = 32
    FILE_DELETE_CHILD            = 64
    FILE_READ_ATTRIBUTES         = 128
    FILE_WRITE_ATTRIBUTES        = 256

    FILE_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x1FF

    FILE_GENERIC_READ =
       STANDARD_RIGHTS_READ |
       FILE_READ_DATA |
       FILE_READ_ATTRIBUTES |
       FILE_READ_EA |
       SYNCHRONIZE

    FILE_GENERIC_WRITE =
       STANDARD_RIGHTS_WRITE |
       FILE_WRITE_DATA |
       FILE_WRITE_ATTRIBUTES |
       FILE_WRITE_EA |
       FILE_APPEND_DATA |
       SYNCHRONIZE

    FILE_GENERIC_EXECUTE =
       STANDARD_RIGHTS_EXECUTE |
       FILE_READ_ATTRIBUTES |
       FILE_EXECUTE |
       SYNCHRONIZE

    FILE_SHARE_READ                = 1
    FILE_SHARE_WRITE               = 2
    FILE_SHARE_DELETE              = 4
    FILE_NOTIFY_CHANGE_FILE_NAME   = 1
    FILE_NOTIFY_CHANGE_DIR_NAME    = 2
    FILE_NOTIFY_CHANGE_ATTRIBUTES  = 4
    FILE_NOTIFY_CHANGE_SIZE        = 8
    FILE_NOTIFY_CHANGE_LAST_WRITE  = 16
    FILE_NOTIFY_CHANGE_LAST_ACCESS = 32
    FILE_NOTIFY_CHANGE_CREATION    = 64
    FILE_NOTIFY_CHANGE_SECURITY    = 256
    FILE_CASE_SENSITIVE_SEARCH     = 1
    FILE_CASE_PRESERVED_NAMES      = 2
    FILE_UNICODE_ON_DISK           = 4
    FILE_PERSISTENT_ACLS           = 8
    FILE_FILE_COMPRESSION          = 16
    FILE_VOLUME_QUOTAS             = 32
    FILE_SUPPORTS_SPARSE_FILES     = 64
    FILE_SUPPORTS_REPARSE_POINTS   = 128
    FILE_SUPPORTS_REMOTE_STORAGE   = 256
    FILE_VOLUME_IS_COMPRESSED      = 0x8000
    FILE_SUPPORTS_OBJECT_IDS       = 0x10000
    FILE_SUPPORTS_ENCRYPTION       = 0x20000

    # File flags

    FILE_FLAG_WRITE_THROUGH       = 0x80000000
    FILE_FLAG_OVERLAPPED          = 0x40000000
    FILE_FLAG_NO_BUFFERING        = 0x20000000
    FILE_FLAG_RANDOM_ACCESS       = 0x10000000
    FILE_FLAG_SEQUENTIAL_SCAN     = 0x08000000
    FILE_FLAG_DELETE_ON_CLOSE     = 0x04000000
    FILE_FLAG_BACKUP_SEMANTICS    = 0x02000000
    FILE_FLAG_POSIX_SEMANTICS     = 0x01000000
    FILE_FLAG_OPEN_REPARSE_POINT  = 0x00200000
    FILE_FLAG_OPEN_NO_RECALL      = 0x00100000
    FILE_FLAG_FIRST_PIPE_INSTANCE = 0x00080000

    # File creation disposition

    CREATE_NEW        = 1
    CREATE_ALWAYS     = 2
    OPEN_EXISTING     = 3
    OPEN_ALWAYS       = 4
    TRUNCATE_EXISTING = 5

    SECTION_QUERY       = 0x0001
    SECTION_MAP_WRITE   = 0x0002
    SECTION_MAP_READ    = 0x0004
    SECTION_MAP_EXECUTE = 0x0008
    SECTION_EXTEND_SIZE = 0x0010

    SECTION_ALL_ACCESS =
       STANDARD_RIGHTS_REQUIRED |
       SECTION_QUERY |
       SECTION_MAP_WRITE |
       SECTION_MAP_READ |
       SECTION_MAP_EXECUTE |
       SECTION_EXTEND_SIZE

    # Errors

    INVALID_FILE_ATTRIBUTES  = 0xFFFFFFFF
    INVALID_SET_FILE_POINTER = 0xFFFFFFFF
    INVALID_FILE_SIZE        = 0xFFFFFFFF

    # Defined in Windows::Handle as well. Here for convenience.

    INVALID_HANDLE_VALUE = 0xFFFFFFFF unless defined? INVALID_HANDLE_VALUE

    # Misc

    LOCKFILE_EXCLUSIVE_LOCK        = 0x00000001
    LOCKFILE_FAIL_IMMEDIATELY      = 0x00000002
    MOVEFILE_REPLACE_EXISTING      = 0x00000001
    MOVEFILE_COPY_ALLOWED          = 0x00000002
    MOVEFILE_DELAY_UNTIL_REBOOT    = 0x00000004
    MOVEFILE_WRITE_THROUGH         = 0x00000008
    MOVEFILE_CREATE_HARDLINK       = 0x00000010
    MOVEFILE_FAIL_IF_NOT_TRACKABLE = 0x00000020
    SYMBOLIC_LINK_FLAG_DIRECTORY   = 0x1

    # FILE_INFO_BY_HANDLE_CLASS enum

    FileBasicInfo                  = 0
    FileStandardInfo               = 1
    FileNameInfo                   = 2
    FileRenameInfo                 = 3
    FileDispositionInfo            = 4
    FileAllocationInfo             = 5
    FileEndOfFileInfo              = 6
    FileStreamInfo                 = 7
    FileCompressionInfo            = 8
    FileAttributeTagInfo           = 9
    FileIdBothDirectoryInfo        = 10
    FileIdBothDirectoryRestartInfo = 11
    FileIoPriorityHintInfo         = 12
    MaximumFileInfoByHandleClass   = 13

    # Reparse point tags

    IO_REPARSE_TAG_DFS         = 0x8000000A
    IO_REPARSE_TAG_DFSR        = 0x80000012
    IO_REPARSE_TAG_HSM         = 0xC0000004
    IO_REPARSE_TAG_HSM2        = 0x80000006
    IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003
    IO_REPARSE_TAG_SIS         = 0x80000007
    IO_REPARSE_TAG_SYMLINK     = 0xA000000C

    attach_function :CopyFileA, [:string, :string, :bool], :bool
    attach_function :CopyFileW, [:string, :string, :bool], :bool
    attach_function :CopyFileExA, [:string, :string, :pointer, :pointer, :pointer, :ulong], :bool # callback
    attach_function :CopyFileExW, [:string, :string, :pointer, :pointer, :pointer, :ulong], :bool # callback
    attach_function :CreateFileA, [:string, :ulong, :ulong, :pointer, :ulong, :ulong, :ulong], :ulong
    attach_function :CreateFileW, [:string, :ulong, :ulong, :pointer, :ulong, :ulong, :ulong], :ulong
    attach_function :CreateHardLinkA, [:string, :string, :pointer], :bool
    attach_function :CreateHardLinkW, [:string, :string, :pointer], :bool
    attach_function :DeleteFileA, [:string], :bool
    attach_function :DeleteFileW, [:string], :bool
    attach_function :FindClose, [:ulong], :bool
    attach_function :FindFirstFileA, [:string, :pointer], :ulong
    attach_function :FindFirstFileW, [:string, :pointer], :ulong
    attach_function :FindFirstFileExA, [:string, :int, :pointer, :int, :pointer, :ulong], :ulong
    attach_function :FindFirstFileExW, [:string, :int, :pointer, :int, :pointer, :ulong], :ulong
    attach_function :FindNextFileA, [:ulong, :pointer], :bool
    attach_function :FindNextFileW, [:ulong, :pointer], :bool
    attach_function :FlushFileBuffers, [:ulong], :bool
    attach_function :GetBinaryTypeA, [:string, :pointer], :bool
    attach_function :GetBinaryTypeW, [:string, :pointer], :bool
    attach_function :GetFileAttributesA, [:string], :ulong
    attach_function :GetFileAttributesW, [:string], :ulong
    attach_function :GetFileAttributesExA, [:string, :pointer, :pointer], :bool
    attach_function :GetFileAttributesExW, [:string, :pointer, :pointer], :bool
    attach_function :GetFileInformationByHandle, [:ulong, :pointer], :bool
    attach_function :GetFileSize, [:ulong, :pointer], :ulong
    attach_function :GetFileSizeEx, [:ulong, :pointer], :bool
    attach_function :GetFileType, [:ulong], :ulong
    attach_function :GetFullPathNameA, [:string, :ulong, :pointer, :pointer], :ulong
    attach_function :GetFullPathNameW, [:string, :ulong, :pointer, :pointer], :ulong
    attach_function :GetLongPathNameA, [:string, :pointer, :ulong], :ulong
    attach_function :GetLongPathNameW, [:string, :pointer, :ulong], :ulong
    attach_function :GetShortPathNameA, [:string, :pointer, :ulong], :ulong
    attach_function :GetShortPathNameW, [:string, :pointer, :ulong], :ulong
    attach_function :GetTempFileNameA, [:string, :string, :uint, :pointer], :uint
    attach_function :GetTempFileNameW, [:string, :string, :uint, :pointer], :uint
    attach_function :LockFile, [:ulong, :ulong, :ulong, :ulong, :ulong], :bool
    attach_function :LockFileEx, [:ulong, :ulong, :ulong, :ulong, :ulong, :pointer], :bool
    attach_function :MoveFileA, [:string, :string], :bool
    attach_function :MoveFileW, [:string, :string], :bool
    attach_function :MoveFileExA, [:string, :string, :ulong], :bool
    attach_function :MoveFileExW, [:string, :string, :ulong], :bool
    attach_function :ReadFile, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :ReadFileEx, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :SetEndOfFile, [:ulong], :bool
    attach_function :SetFileAttributesA, [:string, :ulong], :bool
    attach_function :SetFileAttributesW, [:string, :ulong], :bool
    attach_function :UnlockFile, [:ulong, :ulong, :ulong, :ulong, :ulong], :bool
    attach_function :UnlockFileEx, [:ulong, :ulong, :ulong, :ulong, :pointer], :bool
    attach_function :WriteFile, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :WriteFileEx, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool

    begin
      attach_function :SetFileShortNameA, [:ulong, :string], :bool
      attach_function :SetFileShortNameW, [:ulong, :string], :bool
      attach_function :SetFileValidData, [:ulong, :ulong], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end

    begin
      attach_function :Wow64DisableWow64FsRedirection, [:pointer], :bool
      attach_function :Wow64EnableWow64FsRedirection, [:bool], :bool
      attach_function :Wow64RevertWow64FsRedirection, [:int], :bool
    rescue FFI::NotFoundError
      # Windows XP 64-bit and later
    end

    begin
      attach_function :CreateSymbolicLinkA, [:string, :string, :ulong], :bool
      attach_function :CreateSymbolicLinkW, [:string, :string, :ulong], :bool
      attach_function :CreateSymbolicLinkTransactedA, [:string, :string, :ulong, :ulong], :bool
      attach_function :CreateSymbolicLinkTransactedW, [:string, :string, :ulong, :ulong], :bool
      attach_function :GetFileInformationByHandleEx, [:ulong, :ulong, :pointer, :ulong], :bool
      attach_function :GetFinalPathNameByHandleA, [:ulong, :string, :ulong, :ulong], :ulong
      attach_function :GetFinalPathNameByHandleW, [:ulong, :string, :ulong, :ulong], :ulong
      attach_function :SetFileInformationByHandle, [:ulong, :ulong, :pointer, :ulong], :bool
    rescue FFI::NotFoundError
      # Windows Vista
    end

    ffi_lib :advapi32

    attach_function :DecryptFileA, [:string, :ulong], :bool
    attach_function :DecryptFileW, [:string, :ulong], :bool
    attach_function :EncryptFileA, [:string], :bool
    attach_function :EncryptFileW, [:string], :bool
  end
end
