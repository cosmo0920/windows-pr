require 'ffi'

module Windows
  module NIO
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    # OpenFile() constants

    OF_READ             = 0x00000000
    OF_WRITE            = 0x00000001
    OF_READWRITE        = 0x00000002
    OF_SHARE_COMPAT     = 0x00000000
    OF_SHARE_EXCLUSIVE  = 0x00000010
    OF_SHARE_DENY_WRITE = 0x00000020
    OF_SHARE_DENY_READ  = 0x00000030
    OF_SHARE_DENY_NONE  = 0x00000040
    OF_PARSE            = 0x00000100
    OF_DELETE           = 0x00000200
    OF_VERIFY           = 0x00000400
    OF_CANCEL           = 0x00000800
    OF_CREATE           = 0x00001000
    OF_PROMPT           = 0x00002000
    OF_EXIST            = 0x00004000
    OF_REOPEN           = 0x00008000

    attach_function :CancelIo, [:ulong], :bool
    attach_function :CreateIoCompletionPort, [:ulong, :ulong, :pointer, :ulong], :ulong
    attach_function :FlushFileBuffers, [:ulong], :bool
    attach_function :GetQueuedCompletionStatus, [:ulong, :pointer, :pointer, :pointer, :ulong], :bool
    attach_function :OpenFile, [:string, :pointer, :uint], :ulong
    attach_function :PostQueuedCompletionStatus, [:ulong, :ulong, :pointer, :pointer], :bool
    attach_function :ReadFileScatter, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :SetEndOfFile, [:ulong], :bool
    attach_function :SetFilePointer, [:ulong, :long, :pointer, :ulong], :ulong
    attach_function :SetFilePointerEx, [:ulong, :ulong, :pointer, :ulong], :bool
    attach_function :WriteFileGather, [:ulong, :pointer, :ulong, :pointer, :pointer], :bool

    begin
      attach_function :CancelIoEx, [:ulong, :pointer], :bool
      attach_function :CancelSynchronousIo, [:ulong], :bool
    rescue FFI::NotFoundError
      # Windows Vista or later
    end
  end
end
