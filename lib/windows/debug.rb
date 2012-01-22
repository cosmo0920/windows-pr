require 'ffi'

module Windows
  module Debug
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    attach_function :ContinueDebugEvent, [:ulong, :ulong, :ulong], :bool
    attach_function :DebugActiveProcess, [:ulong], :bool
    attach_function :DebugBreak, [], :void
    attach_function :FatalExit, [:int], :void
    attach_function :FlushInstructionCache, [:long, :pointer, :size_t], :bool
    attach_function :GetThreadContext, [:long, :pointer], :bool
    attach_function :GetThreadSelectorEntry, [:long, :ulong, :pointer], :bool
    attach_function :IsDebuggerPresent, [], :bool
    attach_function :OutputDebugStringA, [:pointer], :void
    attach_function :OutputDebugStringW, [:pointer], :void
    attach_function :ReadProcessMemory, [:long, :long, :pointer, :size_t, :pointer], :bool
    attach_function :SetThreadContext, [:long, :pointer], :bool
    attach_function :WaitForDebugEvent, [:pointer, :ulong], :bool
    attach_function :WriteProcessMemory, [:long, :pointer, :pointer, :size_t, :pointer], :bool

    begin
      attach_function :CheckRemoteDebuggerPresent, [:long, :pointer], :bool
      attach_function :DebugActiveProcessStop, [:ulong], :bool
      attach_function :DebugBreakProcess, [:long], :bool
      attach_function :DebugSetProcessKillOnExit, [:bool], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
