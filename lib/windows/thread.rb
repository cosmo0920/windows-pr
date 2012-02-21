require 'ffi'

module Windows
  module Thread
    extend FFI::Library

    ffi_lib 'kernel32'

    private

    SYNCHRONIZE                 = 0x00100000
    THREAD_ALL_ACCESS           = 0x1F03FF
    THREAD_DIRECT_IMPERSONATION = 0x0200
    THREAD_GET_CONTEXT          = 0x0008
    THREAD_IMPERSONATE          = 0x0100
    THREAD_QUERY_INFORMATION    = 0x0040
    THREAD_SET_CONTEXT          = 0x0010
    THREAD_SET_INFORMATION      = 0x0020
    THREAD_SET_THREAD_TOKEN     = 0x0080
    THREAD_SUSPEND_RESUME       = 0x0002
    THREAD_TERMINATE            = 0x0001

    THREAD_PRIORITY_ABOVE_NORMAL  = 1
    THREAD_PRIORITY_BELOW_NORMAL  = -1
    THREAD_PRIORITY_HIGHEST       = 2
    THREAD_PRIORITY_IDLE          = -15
    THREAD_PRIORITY_LOWEST        = -2
    THREAD_PRIORITY_NORMAL        = 0
    THREAD_PRIORITY_TIME_CRITICAL = 15
      
    attach_function :CreateRemoteThread, [:ulong, :pointer, :size_t, :pointer, :pointer, :ulong, :pointer], :ulong
    attach_function :CreateThread, [:pointer, :size_t, :pointer, :pointer, :ulong, :pointer], :ulong
    attach_function :ExitThread, [:ulong], :void
    attach_function :GetCurrentThread, [], :ulong
    attach_function :GetCurrentThreadId, [], :ulong
    attach_function :GetExitCodeThread, [:ulong, :pointer], :bool
    attach_function :GetThreadPriority, [:ulong], :int
    attach_function :GetThreadPriorityBoost, [:ulong, :pointer], :bool
    attach_function :GetThreadTimes, [:ulong, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :OpenThread, [:ulong, :bool, :ulong], :ulong
    attach_function :ResumeThread, [:ulong], :ulong
    attach_function :SetThreadAffinityMask, [:ulong, :pointer], :ulong
    attach_function :SetThreadIdealProcessor, [:ulong, :ulong], :ulong
    attach_function :SetThreadPriority, [:ulong, :int], :bool
    attach_function :SetThreadPriorityBoost, [:ulong, :bool], :bool
    attach_function :Sleep, [:ulong], :void
    attach_function :SleepEx, [:ulong, :bool], :ulong
    attach_function :SuspendThread, [:ulong], :ulong
    attach_function :SwitchToThread, [], :bool
    attach_function :TerminateThread, [:ulong, :ulong], :bool
    attach_function :TlsAlloc, [], :ulong
    attach_function :TlsFree, [:ulong], :bool
    attach_function :TlsGetValue, [:ulong], :ulong
    attach_function :TlsSetValue, [:ulong, :ulong], :bool

    ffi_lib 'user32'

    begin
      attach_function :AttachThreadInput, [:ulong, :ulong, :bool], :bool
      attach_function :GetThreadIOPendingFlag, [:ulong, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
