require 'ffi'

module Windows
  module MSVCRT
    module Buffer
      extend FFI::Library
      ffi_lib 'msvcrt'

      private

      attach_function :memcpy, [:pointer, :pointer, :size_t], :pointer
      attach_function :_memccpy, [:pointer, :pointer, :int, :size_t], :pointer
      attach_function :memchr, [:pointer, :int, :size_t], :pointer
      attach_function :memcmp, [:pointer, :pointer, :size_t], :int
      attach_function :_memicmp, [:pointer, :pointer, :size_t], :int
      attach_function :memmove, [:pointer, :pointer, :size_t], :pointer
      attach_function :memset, [:pointer, :int, :size_t], :pointer
      attach_function :_swab, [:pointer, :pointer, :int], :void
    end
  end
end
