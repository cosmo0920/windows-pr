require 'ffi'

module Windows
  module Library
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    DLL_PROCESS_DETACH = 0
    DLL_PROCESS_ATTACH = 1
    DLL_THREAD_ATTACH  = 2
    DLL_THREAD_DETACH  = 3

    GET_MODULE_HANDLE_EX_FLAG_PIN                = 1
    GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 2
    GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS       = 4

    DONT_RESOLVE_DLL_REFERENCES   = 0x00000001
    LOAD_LIBRARY_AS_DATAFILE      = 0x00000002
    LOAD_WITH_ALTERED_SEARCH_PATH = 0x00000008
    LOAD_IGNORE_CODE_AUTHZ_LEVEL  = 0x00000010

    attach_function :DisableThreadLibraryCalls, [:ulong], :bool
    attach_function :FreeLibrary, [:ulong], :bool
    attach_function :FreeLibraryAndExitThread, [:ulong, :ulong], :void
    attach_function :GetModuleFileNameA, [:ulong, :pointer, :ulong], :ulong
    attach_function :GetModuleFileNameW, [:ulong, :pointer, :ulong], :ulong
    attach_function :GetModuleHandleA, [:string], :ulong
    attach_function :GetModuleHandleW, [:string], :ulong
    attach_function :GetProcAddress, [:ulong, :string], :pointer
    attach_function :LoadLibraryA, [:string], :ulong
    attach_function :LoadLibraryW, [:string], :ulong
    attach_function :LoadLibraryExA, [:string, :ulong, :ulong], :ulong
    attach_function :LoadLibraryExW, [:string, :ulong, :ulong], :ulong
    attach_function :LoadModule, [:string, :pointer], :ulong

    begin
      attach_function :GetDllDirectoryA, [:ulong, :pointer], :ulong
      attach_function :GetDllDirectoryW, [:ulong, :pointer], :ulong
      attach_function :GetModuleHandleExA, [:ulong, :string, :pointer], :bool
      attach_function :GetModuleHandleExW, [:ulong, :string, :pointer], :bool
      attach_function :SetDllDirectoryA, [:string], :bool
      attach_function :SetDllDirectoryW, [:string], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
