require 'ffi'

module Windows
  module Window
    module Timer
      extend FFI::Library
      ffi_lib 'user32'

      private

      attach_function :KillTimer, [:ulong, :pointer], :bool
      attach_function :SetTimer, [:ulong, :pointer, :uint, :pointer], :pointer # callback
    end
  end
end
