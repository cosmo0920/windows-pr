require 'ffi'

module Windows
  module Handle
    extend FFI::Library

    private

    INVALID_HANDLE_VALUE           = 0xFFFFFFFF
    HANDLE_FLAG_INHERIT            = 0x00000001
    HANDLE_FLAG_PROTECT_FROM_CLOSE = 0x00000002

    ffi_lib 'kernel32'

    attach_function :CloseHandle, [:long], :bool
    attach_function :DuplicateHandle, [:long, :long, :long, :pointer, :long, :bool, :long], :bool
    attach_function :GetHandleInformation, [:long, :pointer], :bool
    attach_function :SetHandleInformation, [:long, :long, :long], :bool

    ffi_lib 'msvcrt'

    attach_function :_get_osfhandle, [:int], :long
    attach_function :_open_osfhandle, [:long, :int], :int
  end
end
