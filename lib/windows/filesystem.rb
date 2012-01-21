require 'ffi'

module Windows
  module FileSystem
    extend FFI::Library
    ffi_lib 'kernel32'

    private


    attach_function :GetDiskFreeSpaceA, [:string, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :GetDiskFreeSpaceW, [:string, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :GetDiskFreeSpaceExA, [:string, :pointer, :pointer, :pointer], :bool
    attach_function :GetDiskFreeSpaceExW, [:string, :pointer, :pointer, :pointer], :bool
  end
end
