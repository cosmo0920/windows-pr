require 'ffi'

module Windows
  module COM
    module Variant
      extend FFI::Library
      ffi_lib 'oleaut32'

      private
         
      VARIANT_TRUE  = -1
      VARIANT_FALSE = 0
        
      attach_function :VariantChangeType, [:pointer, :pointer, :ushort, :long], :long
      attach_function :VariantChangeTypeEx, [:pointer, :pointer, :long, :ushort, :long], :long
      attach_function :VariantClear, [:pointer], :long
      attach_function :VariantCopy, [:pointer, :pointer], :long
      attach_function :VariantCopyInd, [:pointer, :pointer], :long
      attach_function :VariantInit, [:pointer], :void
    end      
  end   
end
