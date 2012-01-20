require 'ffi'

# The Windows::Directory module contains functions that are used in directory
# management. Note that functions that could be applied to files or
# directories, such as CreateFile(), are probably in the Windows::File
# module.
#
module Windows
  module Directory
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    attach_function :CreateDirectoryA, [:pointer, :pointer], :bool
    attach_function :CreateDirectoryW, [:pointer, :pointer], :bool
    attach_function :CreateDirectoryExA, [:pointer, :pointer, :pointer], :bool
    attach_function :CreateDirectoryExW, [:pointer, :pointer, :pointer], :bool
    attach_function :FindCloseChangeNotification, [:long], :bool
    attach_function :FindFirstChangeNotificationA, [:string, :bool, :long], :long
    attach_function :FindFirstChangeNotificationW, [:string, :bool, :long], :long
    attach_function :FindNextChangeNotification, [:long], :bool
    attach_function :GetCurrentDirectoryA, [:long, :pointer], :long
    attach_function :GetCurrentDirectoryW, [:long, :pointer], :long
    attach_function :ReadDirectoryChangesW, [:long, :pointer, :long, :bool, :long, :pointer, :pointer], :bool
    attach_function :RemoveDirectoryA, [:string], :bool
    attach_function :RemoveDirectoryW, [:string], :bool
    attach_function :RemoveDirectoryTransactedA, [:string, :long], :bool
    attach_function :RemoveDirectoryTransactedW, [:string, :long], :bool
    attach_function :SetCurrentDirectoryA, [:string], :bool
    attach_function :SetCurrentDirectoryW, [:string], :bool
  end
end
