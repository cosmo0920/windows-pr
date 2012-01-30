require 'ffi'

module Windows
  module Pipe
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    NMPWAIT_NOWAIT           = 0x00000001
    NMPWAIT_WAIT_FOREVER     = 0xffffffff
    NMPWAIT_USE_DEFAULT_WAIT = 0x00000000

    PIPE_WAIT             = 0x00000000
    PIPE_NOWAIT           = 0x00000001
    PIPE_ACCESS_INBOUND   = 0x00000001
    PIPE_ACCESS_OUTBOUND  = 0x00000002
    PIPE_ACCESS_DUPLEX    = 0x00000003
    PIPE_TYPE_BYTE        = 0x00000000
    PIPE_TYPE_MESSAGE     = 0x00000004
    PIPE_READMODE_BYTE    = 0x00000000
    PIPE_READMODE_MESSAGE = 0x00000002
    PIPE_CLIENT_END       = 0x00000000
    PIPE_SERVER_END       = 0x00000001
    
    PIPE_UNLIMITED_INSTANCES = 255

    attach_function :CallNamedPipeA, [:string, :pointer, :ulong, :pointer, :ulong, :pointer, :ulong], :bool
    attach_function :CallNamedPipeW, [:string, :pointer, :ulong, :pointer, :ulong, :pointer, :ulong], :bool
    attach_function :ConnectNamedPipe, [:ulong, :pointer], :bool
    attach_function :CreateNamedPipeA, [:string, :ulong, :ulong, :ulong, :ulong, :ulong, :ulong, :pointer], :ulong
    attach_function :CreateNamedPipeW, [:string, :ulong, :ulong, :ulong, :ulong, :ulong, :ulong, :pointer], :ulong
    attach_function :CreatePipe, [:pointer, :pointer, :pointer, :ulong], :bool
    attach_function :DisconnectNamedPipe, [:ulong], :bool
    attach_function :GetNamedPipeHandleStateA, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :ulong], :bool
    attach_function :GetNamedPipeHandleStateW, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :ulong], :bool
    attach_function :GetNamedPipeInfo, [:ulong, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :PeekNamedPipe, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer], :bool
    attach_function :SetNamedPipeHandleState, [:ulong, :pointer, :pointer, :pointer], :bool
    attach_function :TransactNamedPipe, [:ulong, :pointer, :ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :WaitNamedPipeA, [:string, :ulong], :bool
    attach_function :WaitNamedPipeW, [:string, :ulong], :bool

    begin
      attach_function :GetNamedPipeClientComputerNameA, [:ulong, :pointer, :ulong], :bool
      attach_function :GetNamedPipeClientComputerNameW, [:ulong, :pointer, :ulong], :bool
      attach_function :GetNamedPipeClientProcessId, [:ulong, :pointer], :bool
      attach_function :GetNamedPipeClientSessionId, [:ulong, :pointer], :bool
    rescue FFI::NotFoundError
      # Vista or later
    end
  end
end
