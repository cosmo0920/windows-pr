require 'ffi'

module Windows
  module COM
    module Automation
      extend FFI::Library

      private
         
      REGKIND_DEFAULT  = 0
      REGKIND_REGISTER = 1
      REGKIND_NONE     = 2
       
      # VARKIND enum
       
      VAR_PERINSTANCE = 0
      VAR_STATIC      = 1
      VAR_CONST       = 2
      VAR_DISPATCH    = 3
       
      # TYPEKIND enum
       
      TKIND_ENUM      = 0
      TKIND_RECORD    = 1
      TKIND_MODULE    = 2
      TKIND_INTERFACE = 3
      TKIND_DISPATCH  = 4
      TKIND_COCLASS   = 5
      TKIND_ALIAS     = 6
      TKIND_UNION     = 7
      TKIND_MAX       = 8
       
      # LIBFLAGS enum
       
      LIBFLAG_FRESTRICTED   = 0x1
      LIBFLAG_FCONTROL      = 0x2
      LIBFLAG_FHIDDEN       = 0x4
      LIBFLAG_FHASDISKIMAGE = 0x8
 
      PARAMFLAG_NONE         =  0     
      PARAMFLAG_FIN          =  0x1     
      PARAMFLAG_FOUT         =  0x2     
      PARAMFLAG_FLCID        =  0x4     
      PARAMFLAG_FRETVAL      =  0x8     
      PARAMFLAG_FOPT         =  0x10     
      PARAMFLAG_FHASDEFAULT  =  0x20     
      PARAMFLAG_FHASCUSTDATA =  0x40
       
      # FUNCFLAGS enum
       
      FUNCFLAG_FRESTRICTED       = 0x1
      FUNCFLAG_FSOURCE           = 0x2
      FUNCFLAG_FBINDABLE         = 0x4
      FUNCFLAG_FREQUESTEDIT      = 0x8
      FUNCFLAG_FDISPLAYBIND      = 0x10
      FUNCFLAG_FDEFAULTBIND      = 0x20
      FUNCFLAG_FHIDDEN           = 0x40
      FUNCFLAG_FUSESGETLASTERROR = 0x80
      FUNCFLAG_FDEFAULTCOLLELEM  = 0x100
      FUNCFLAG_FUIDEFAULT        = 0x200
      FUNCFLAG_FNONBROWSABLE     = 0x400
      FUNCFLAG_FREPLACEABLE      = 0x800
      FUNCFLAG_FIMMEDIATEBIND    = 0x1000
       
      # TYPEFLAGS enum
       
      TYPEFLAG_FAPPOBJECT     = 0x1
      TYPEFLAG_FCANCREATE     = 0x2
      TYPEFLAG_FLICENSED      = 0x4
      TYPEFLAG_FPREDECLID     = 0x8
      TYPEFLAG_FHIDDEN        = 0x10
      TYPEFLAG_FCONTROL       = 0x20
      TYPEFLAG_FDUAL          = 0x40
      TYPEFLAG_FNONEXTENSIBLE = 0x80
      TYPEFLAG_FOLEAUTOMATION = 0x100
      TYPEFLAG_FRESTRICTED    = 0x200
      TYPEFLAG_FAGGREGATABLE  = 0x400
      TYPEFLAG_FREPLACEABLE   = 0x800
      TYPEFLAG_FDISPATCHABLE  = 0x1000
      TYPEFLAG_FREVERSEBIND   = 0x2000
      TYPEFLAG_FPROXY         = 0x4000
       
      # VARFLAGS enum
       
      VARFLAG_FREADONLY        = 0x1
      VARFLAG_FSOURCE          = 0x2
      VARFLAG_FBINDABLE        = 0x4
      VARFLAG_FREQUESTEDIT     = 0x8
      VARFLAG_FDISPLAYBIND     = 0x10
      VARFLAG_FDEFAULTBIND     = 0x20
      VARFLAG_FHIDDEN          = 0x40
      VARFLAG_FRESTRICTED      = 0x80
      VARFLAG_FDEFAULTCOLLELEM = 0x100
      VARFLAG_FUIDEFAULT       = 0x200
      VARFLAG_FNONBROWSABLE    = 0x400
      VARFLAG_FREPLACEABLE     = 0x800
      VARFLAG_FIMMEDIATEBIND   = 0x1000

      ffi_lib 'oleaut32'

      attach_function :BstrFromVector, [:pointer, :pointer], :long
      attach_function :CreateErrorInfo, [:pointer], :long
      attach_function :CreateTypeLib2, [:pointer, :pointer, :pointer], :long
      attach_function :DispGetIDsOfNames, [:pointer, :pointer, :uint, :pointer], :long
      attach_function :DispGetParam, [:pointer, :uint, :long, :pointer, :pointer], :long
      attach_function :DispInvoke, [:pointer, :pointer, :pointer, :ushort, :pointer, :pointer, :pointer, :pointer], :long
      attach_function :GetActiveObject, [:pointer, :pointer, :pointer], :long
      attach_function :LoadRegTypeLib, [:pointer, :ushort, :ushort, :long, :pointer], :long
      attach_function :LoadTypeLib, [:pointer, :pointer], :long
      attach_function :LoadTypeLibEx, [:pointer, :long, :pointer], :long
      attach_function :RegisterActiveObject, [:pointer, :pointer, :long, :pointer], :long
      attach_function :RevokeActiveObject, [:long, :pointer], :long
      attach_function :RegisterTypeLib, [:pointer, :pointer, :pointer], :long
      attach_function :SafeArrayAccessData, [:pointer, :pointer], :long
      attach_function :SafeArrayAllocData, [:pointer], :long
      attach_function :SafeArrayAllocDescriptor, [:uint, :pointer], :long
      attach_function :SafeArrayCopy, [:pointer, :pointer], :long
      attach_function :SafeArrayCopyData, [:pointer, :pointer], :long
      attach_function :SafeArrayCreate, [:long, :uint, :pointer], :pointer
      attach_function :SafeArrayCreateEx, [:long, :uint, :pointer, :pointer], :pointer
      attach_function :SafeArrayCreateVector, [:long, :long, :ulong], :pointer
      attach_function :SafeArrayCreateVectorEx, [:long, :long, :ulong, :pointer], :pointer
      attach_function :SafeArrayDestroy, [:pointer], :long
      attach_function :SafeArrayDestroyData, [:pointer], :long
      attach_function :SafeArrayDestroyDescriptor, [:pointer], :long
      attach_function :SafeArrayGetDim, [:pointer], :uint
      attach_function :SafeArrayGetElement, [:pointer, :pointer, :pointer], :long
      attach_function :SafeArrayGetElemsize, [:pointer], :uint
      attach_function :SafeArrayGetIID, [:pointer, :pointer], :long
      attach_function :SafeArrayGetLBound, [:pointer, :uint, :pointer], :long
      attach_function :SafeArrayGetRecordInfo, [:pointer, :pointer], :long
      attach_function :SafeArrayGetUBound, [:pointer, :uint, :pointer], :long
      attach_function :SafeArrayLock, [:pointer], :long
      attach_function :SafeArrayPtrOfIndex, [:pointer, :pointer, :pointer], :long
      attach_function :SafeArrayPutElement, [:pointer, :pointer, :pointer], :long
      attach_function :SafeArrayRedim, [:pointer, :pointer], :long
      attach_function :SafeArraySetRecordInfo, [:pointer, :pointer], :long
      attach_function :SafeArrayUnaccessData, [:pointer], :long
      attach_function :SafeArrayUnlock, [:pointer], :long
      attach_function :SetErrorInfo, [:ulong, :pointer], :long
      attach_function :SysAllocString, [:pointer], :pointer
      attach_function :SysAllocStringByteLen, [:pointer, :uint], :pointer
      attach_function :SysAllocStringLen, [:pointer, :uint], :pointer
      attach_function :SysFreeString, [:pointer], :long
      attach_function :SysReAllocString, [:pointer, :pointer], :long
      attach_function :SysReAllocStringLen, [:pointer, :pointer, :uint], :long
      attach_function :SysStringByteLen, [:pointer], :long
      attach_function :SysStringLen, [:pointer], :long
      attach_function :SystemTimeToVariantTime, [:pointer, :pointer], :int
      attach_function :UnRegisterTypeLib, [:pointer, :ushort, :ushort, :long, :long], :long
      attach_function :VectorFromBstr, [:pointer, :pointer], :long
    end
  end
end
