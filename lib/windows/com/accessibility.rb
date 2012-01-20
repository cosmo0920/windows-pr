require 'ffi'

module Windows
  module COM
    module Accessibility
      extend FFI::Library
      ffi_lib 'oleacc'

      private

      attach_function :ObjectFromLResult, [:long, :pointer, :uint, :pointer], :long
    end
  end
end
