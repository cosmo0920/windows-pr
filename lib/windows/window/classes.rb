require 'ffi'

module Windows
  module Window
    module Classes
      extend FFI::Library
      ffi_lib 'user32'

      private

      # Class Field Offsets

      GCL_MENUNAME      = -8
      GCL_HBRBACKGROUND = -10
      GCL_HCURSOR       = -12
      GCL_HICON         = -14
      GCL_HMODULE       = -16
      GCL_CBWNDEXTRA    = -18
      GCL_CBCLSEXTRA    = -20
      GCL_WNDPROC       = -24
      GCL_STYLE         = -26
      GCW_ATOM          = -32

      # Window Field Offsets

      GWL_WNDPROC    = -4
      GWL_HINSTANCE  = -6
      GWL_HWNDPARENT = -8
      GWL_STYLE      = -16
      GWL_EXSTYLE    = -20
      GWL_USERDATA   = -21
      GWL_ID         = -12

      attach_function :GetClassInfoA, [:ulong, :string, :pointer], :bool
      attach_function :GetClassInfoW, [:ulong, :string, :pointer], :bool
      attach_function :GetClassInfoExA, [:ulong, :string, :pointer], :bool
      attach_function :GetClassInfoExW, [:ulong, :string, :pointer], :bool
      attach_function :GetClassLongA, [:ulong, :int], :ulong
      attach_function :GetClassLongW, [:ulong, :int], :ulong
      attach_function :GetClassNameA, [:ulong, :string, :int], :int
      attach_function :GetClassNameW, [:ulong, :string, :int], :int
      attach_function :GetClassWord, [:ulong, :int], :ushort
      attach_function :GetWindowLongA, [:ulong, :int], :long
      attach_function :GetWindowLongW, [:ulong, :int], :long
      attach_function :RegisterClassA, [:pointer], :ushort
      attach_function :RegisterClassW, [:pointer], :ushort
      attach_function :RegisterClassExA, [:pointer], :ushort
      attach_function :RegisterClassExW, [:pointer], :ushort
      attach_function :SetClassLongA, [:ulong, :int, :long], :ulong
      attach_function :SetClassLongW, [:ulong, :int, :long], :ulong
      attach_function :SetClassWord, [:ulong, :int, :ushort], :ushort
      attach_function :SetWindowLongA, [:ulong, :int, :long], :long
      attach_function :SetWindowLongW, [:ulong, :int, :long], :long
      attach_function :UnregisterClassA, [:string, :ulong], :bool
      attach_function :UnregisterClassW, [:string, :ulong], :bool
       
      begin
        attach_function :GetWindowLongPtr, [:ulong, :int], :ulong
        attach_function :SetWindowLongPtr, [:ulong, :int, :long], :ulong
      rescue FFI::NotFoundError
        # In 32-bit Windows, these methods are aliases for GetWindowLong and SetWindowLong
      end
   end
  end
end
