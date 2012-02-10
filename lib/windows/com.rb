require 'ffi'

module Windows
  module COM
    extend FFI::Library
    ffi_lib 'ole32'

    private

    # These constants are from wtypes.h but are only used in a COM context
    # as far as I know.

    VT_EMPTY    = 0
    VT_NULL     = 1
    VT_I2       = 2
    VT_I4       = 3
    VT_R4       = 4
    VT_R8       = 5
    VT_CY       = 6
    VT_DATE     = 7
    VT_BSTR     = 8
    VT_DISPATCH = 9
    VT_ERROR    = 10
    VT_BOOL     = 11
    VT_VARIANT  = 12
    VT_UNKNOWN  = 13
    VT_DECIMAL  = 14
    VT_I1       = 16
    VT_UI1      = 17
    VT_UI2      = 18
    VT_UI4      = 19
    VT_I8       = 20
    VT_UI8      = 21
    VT_INT      = 22
    VT_UINT     = 23
    VT_VOID     = 24
    VT_HRESULT  = 25
    VT_PTR      = 26

    VT_SAFEARRAY        = 27
    VT_CARRAY           = 28
    VT_USERDEFINED      = 29
    VT_LPSTR            = 30
    VT_LPWSTR           = 31
    VT_RECORD           = 36
    VT_INT_PTR          = 37
    VT_UINT_PTR         = 38
    VT_FILETIME         = 64
    VT_BLOB             = 65
    VT_STREAM           = 66
    VT_STORAGE          = 67
    VT_STREAMED_OBJECT  = 68
    VT_STORED_OBJECT    = 69
    VT_BLOB_OBJECT      = 70
    VT_CF               = 71
    VT_CLSID            = 72
    VT_VERSIONED_STREAM = 73
    VT_BSTR_BLOB        = 0xfff
    VT_VECTOR           = 0x1000
    VT_ARRAY            = 0x2000
    VT_BYREF            = 0x4000
    VT_RESERVED         = 0x8000
    VT_ILLEGAL          = 0xffff
    VT_ILLEGALMASKED    = 0xfff
    VT_TYPEMASK         = 0xfff

    # These constants are from OAldl.h

    INVOKE_FUNC           = 1
    INVOKE_PROPERTYGET    = 2
    INVOKE_PROPERTYPUT    = 4
    INVOKE_PROPERTYPUTREF = 8

    # CLSCTX enum constants

    CLSCTX_INPROC_SERVER          = 0x1
    CLSCTX_INPROC_HANDLER         = 0x2
    CLSCTX_LOCAL_SERVER           = 0x4
    CLSCTX_INPROC_SERVER16        = 0x8
    CLSCTX_REMOTE_SERVER          = 0x10
    CLSCTX_INPROC_HANDLER16       = 0x20
    CLSCTX_RESERVED1              = 0x40
    CLSCTX_RESERVED2              = 0x80
    CLSCTX_RESERVED3              = 0x100
    CLSCTX_RESERVED4              = 0x200
    CLSCTX_NO_CODE_DOWNLOAD       = 0x400
    CLSCTX_RESERVED5              = 0x800
    CLSCTX_NO_CUSTOM_MARSHAL      = 0x1000
    CLSCTX_ENABLE_CODE_DOWNLOAD   = 0x2000
    CLSCTX_NO_FAILURE_LOG         = 0x4000
    CLSCTX_DISABLE_AAA            = 0x8000
    CLSCTX_ENABLE_AAA             = 0x10000
    CLSCTX_FROM_DEFAULT_CONTEXT   = 0x20000
    CLSCTX_ACTIVATE_32_BIT_SERVER = 0x40000
    CLSCTX_ACTIVATE_64_BIT_SERVER = 0x80000

    # IDispatch

    DISPID_UNKNOWN     = -1
    DISPID_VALUE       = 0
    DISPID_PROPERTYPUT = -3
    DISPID_NEWENUM     = -4
    DISPID_EVALUATE    = -5
    DISPID_CONSTRUCTOR = -6
    DISPID_DESTRUCTOR  = -7
    DISPID_COLLECT     = -8

    # Flags for IDispatch::Invoke

    DISPATCH_METHOD         = 0x1
    DISPATCH_PROPERTYGET    = 0x2
    DISPATCH_PROPERTYPUT    = 0x4
    DISPATCH_PROPERTYPUTREF = 0x8

    attach_function :BindMoniker, [:pointer, :ulong, :pointer, :pointer], :long
    attach_function :CLSIDFromProgID, [:pointer, :pointer], :long
    attach_function :CLSIDFromProgIDEx, [:pointer, :pointer], :long
    attach_function :CLSIDFromString, [:pointer, :pointer], :long
    attach_function :CoAddRefServerProcess, [], :ulong
    attach_function :CoAllowSetForegroundWindow, [:pointer, :pointer], :long
    attach_function :CoCancelCall, [:ulong, :ulong], :long
    attach_function :CoCopyProxy, [:pointer, :pointer], :long
    attach_function :CoCreateFreeThreadedMarshaler, [:pointer, :pointer], :long
    attach_function :CoCreateGuid, [:pointer], :long
    attach_function :CoCreateInstance, [:pointer, :pointer, :ulong, :pointer, :pointer], :long
    attach_function :CoCreateInstanceEx, [:pointer, :pointer, :ulong, :pointer, :ulong, :pointer], :long
    attach_function :CoDisableCallCancellation, [:pointer], :long
    attach_function :CoDisconnectObject, [:ulong], :long
    attach_function :CoEnableCallCancellation, [:ulong], :long
    attach_function :CoFileTimeNow, [:pointer], :long
    attach_function :CoFileTimeToDosDateTime, [:pointer, :pointer, :pointer], :bool
    attach_function :CoFreeAllLibraries, [], :void
    attach_function :CoFreeLibrary, [:ulong], :void
    attach_function :CoFreeUnusedLibraries, [], :void
    attach_function :CoFreeUnusedLibrariesEx, [:ulong, :ulong], :void
    attach_function :CoGetCallContext, [:pointer, :pointer], :long
    attach_function :CoGetCallerTID, [:pointer], :long
    attach_function :CoGetCancelObject, [:ulong, :pointer, :pointer], :long
    attach_function :CoGetClassObject, [:pointer, :ulong, :pointer, :pointer, :pointer], :long
    attach_function :CoGetContextToken, [:pointer], :long
    attach_function :CoGetCurrentLogicalThreadId, [:pointer], :long
    attach_function :CoGetCurrentProcess, [], :ulong
    attach_function :CoGetInstanceFromFile, [:pointer, :pointer, :pointer, :ulong, :ulong, :pointer, :ulong, :pointer], :long
    attach_function :CoGetInstanceFromIStorage, [:pointer, :pointer, :pointer, :ulong, :pointer, :ulong, :pointer], :long
    attach_function :CoInitialize, [:pointer], :long
    attach_function :CoTaskMemFree, [:pointer], :void
    attach_function :CoUninitialize, [], :void
    attach_function :CoUnmarshalHresult, [:pointer, :pointer], :long
    attach_function :CoUnmarshalInterface, [:pointer, :pointer, :pointer], :long
    attach_function :CoWaitForMultipleHandles, [:ulong, :ulong, :ulong, :pointer, :pointer], :long
    attach_function :CreateAntiMoniker, [:pointer], :long
    attach_function :CreateBindCtx, [:ulong, :pointer], :long
    attach_function :CreateClassMoniker, [:pointer, :pointer], :long
    attach_function :CreateFileMoniker, [:pointer, :pointer], :long
    attach_function :CreateGenericComposite, [:pointer, :pointer, :pointer], :long
    attach_function :CreateItemMoniker, [:pointer, :pointer, :pointer], :long
    attach_function :CreateObjrefMoniker, [:pointer, :pointer], :long
    attach_function :CreatePointerMoniker, [:pointer, :pointer], :long
    attach_function :GetClassFile, [:pointer, :pointer], :long
    attach_function :GetRunningObjectTable, [:ulong, :pointer], :long
    attach_function :IIDFromString, [:pointer, :pointer], :long
    attach_function :IsAccelerator, [:ulong, :int, :pointer, :pointer], :bool
    attach_function :IsEqualGUID, [:pointer, :pointer], :bool
    attach_function :MkParseDisplayName, [:pointer, :pointer, :pointer, :pointer], :long
    attach_function :MonikerCommonPrefixWith, [:pointer, :pointer, :pointer], :long
    attach_function :MonikerRelativePathTo, [:pointer, :pointer, :pointer, :bool], :long
    attach_function :OleDoAutoConvert, [:pointer, :pointer], :long
    attach_function :OleGetAutoConvert, [:pointer, :pointer], :long
    attach_function :OleGetIconOfClass, [:pointer, :pointer, :bool], :ulong
    attach_function :OleGetIconOfFile, [:pointer, :bool], :ulong
    attach_function :OleInitialize, [], :long
    attach_function :OleRegGetMiscStatus, [:pointer, :ulong, :pointer], :long
    attach_function :OleRegGetUserType, [:pointer, :ulong, :pointer], :long
    attach_function :OleSetAutoConvert, [:pointer, :pointer], :long
    attach_function :OleUninitialize, [], :void
    attach_function :ProgIDFromCLSID, [:pointer, :pointer], :long
    attach_function :StringFromCLSID, [:pointer, :pointer], :long
    attach_function :StringFromGUID2, [:pointer, :pointer, :int], :int
    attach_function :StringFromIID, [:pointer, :pointer], :long

    begin
      attach_function :CoDisconnectContext, [:ulong], :long
    rescue FFI::NotFoundError
      # Windows Vista or later
    end

    ffi_lib 'urlmon'

    attach_function :CreateAsyncBindCtx, [:ulong, :pointer, :pointer, :pointer], :long # callback

    ffi_lib 'olepro32'

    attach_function :OleIconToCursor, [:pointer, :ulong], :ulong
  end
end
