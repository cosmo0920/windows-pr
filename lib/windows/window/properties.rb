require 'ffi'

module Windows
  module Window
    module Properties
      extend FFI::Library
      ffi_lib 'user32'

      private

      attach_function :EnumPropsA, [:ulong, :pointer], :int # callback
      attach_function :EnumPropsW, [:ulong, :pointer], :int # callback
      attach_function :EnumPropsExA, [:ulong, :pointer, :pointer], :int # callback
      attach_function :EnumPropsExW, [:ulong, :pointer, :pointer], :int # callback
      attach_function :GetPropA, [:ulong, :string], :ulong
      attach_function :GetPropW, [:ulong, :string], :ulong
      attach_function :RemovePropA, [:ulong, :string], :ulong
      attach_function :RemovePropW, [:ulong, :string], :ulong
      attach_function :SetPropA, [:ulong, :string, :ulong], :bool
      attach_function :SetPropW, [:ulong, :string, :ulong], :bool
    end
  end
end
