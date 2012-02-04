require 'ffi'

# Functions and constants from tlhelp32.h

module Windows
  module ToolHelper
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    TH32CS_SNAPHEAPLIST = 0x00000001 
    TH32CS_SNAPPROCESS  = 0x00000002 
    TH32CS_SNAPTHREAD   = 0x00000004 
    TH32CS_SNAPMODULE   = 0x00000008 
    TH32CS_SNAPMODULE32 = 0x00000010 
    TH32CS_INHERIT      = 0x80000000
    TH32CS_SNAPALL = TH32CS_SNAPHEAPLIST | TH32CS_SNAPMODULE |
       TH32CS_SNAPPROCESS | TH32CS_SNAPTHREAD
    
    attach_function :CreateToolhelp32Snapshot, [:ulong, :ulong], :ulong
    attach_function :Heap32First, [:pointer, :ulong, :pointer], :bool
    attach_function :Heap32ListFirst, [:ulong, :pointer], :bool
    attach_function :Heap32ListNext, [:ulong, :pointer], :bool
    attach_function :Heap32Next, [:pointer], :bool
    attach_function :Module32First, [:ulong, :pointer], :bool
    attach_function :Module32Next, [:ulong, :pointer], :bool
    attach_function :Process32First, [:ulong, :pointer], :bool
    attach_function :Process32Next, [:ulong, :pointer], :bool
    attach_function :Thread32First, [:ulong, :pointer], :bool
    attach_function :Thread32Next, [:ulong, :pointer], :bool
    attach_function :Toolhelp32ReadProcessMemory, [:ulong, :ulong, :pointer, :size_t, :size_t], :bool
  end
end
