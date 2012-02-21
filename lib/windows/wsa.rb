require 'ffi'

module Windows
  module WSA
    extend FFI::Library
    ffi_lib 'ws2_32'

    private

    # Constants

    WSA_FLAG_OVERLAPPED             = 0x01
    WSA_FLAG_MULTIPOINT_C_ROOT      = 0x02
    WSA_FLAG_MULTIPOINT_C_LEAF      = 0x04
    WSA_FLAG_MULTIPOINT_D_ROOT      = 0x08
    WSA_FLAG_MULTIPOINT_D_LEAF      = 0x10
    WSA_FLAG_ACCESS_SYSTEM_SECURITY = 0x40
    WSA_FLAG_NO_HANDLE_INHERIT      = 0x80

    # WSASETSERVICEOP enum

    RNRSERVICE_REGISTER   = 0
    RNRSERVICE_DEREGISTER = 1
    RNRSERVICE_DELETE     = 2

    # Error codes
 
    WSA_INVALID_HANDLE    = 6
    WSA_NOT_ENOUGH_MEMORY = 8
    WSA_INVALID_PARAMETER = 87
    WSA_OPERATION_ABORTED = 995
    WSA_IO_INCOMPLETE     = 996
    WSA_IO_PENDING        = 997
    WSAEINTR              = 10004
    WSAEBADF              = 10009
    WSAEACCESS            = 10013
    WSAEFAULT             = 10014
    WSAEINVAL             = 10022
    WSAEMFILE             = 10024
    WSAEWOULDBLOCK        = 10035
    WSAEINPROGRESS        = 10036
    WSAEALREADY           = 10037
    WSAENOTSOCK           = 10038
    WSAEDESTADDRREQ       = 10039
    WSAEMSGSIZE           = 10040
    
    # Functions

    attach_function :WSAAccept, [:ulong, :pointer, :pointer, :pointer, :pointer], :ulong # callback
    attach_function :WSAAddressToStringA, [:pointer, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :WSAAddressToStringW, [:pointer, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :WSAAsyncGetHostByAddr, [:ulong, :uint, :string, :int, :int, :pointer, :int], :ulong
    attach_function :WSAAsyncGetHostByName, [:ulong, :uint, :string, :pointer, :int], :ulong
    attach_function :WSAAsyncGetProtoByName, [:ulong, :uint, :string, :pointer, :int], :ulong
    attach_function :WSAAsyncGetProtoByNumber, [:ulong, :uint, :int, :string, :int], :ulong
    attach_function :WSAAsyncGetServByName, [:ulong, :uint, :string, :string, :pointer, :int], :ulong
    attach_function :WSAAsyncGetServByPort, [:ulong, :uint, :int, :string, :pointer, :int], :ulong
    attach_function :WSAAsyncSelect, [:ulong, :ulong, :uint, :long], :int
    attach_function :WSACancelAsyncRequest, [:ulong], :int
    attach_function :WSACleanup, [], :int
    attach_function :WSACloseEvent, [:ulong], :bool
    attach_function :WSAConnect, [:ulong, :pointer, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :WSACreateEvent, [], :ulong
    attach_function :WSADuplicateSocketA, [:ulong, :ulong, :pointer], :int
    attach_function :WSADuplicateSocketW, [:ulong, :ulong, :pointer], :int
    attach_function :WSAEnumNetworkEvents, [:ulong, :ulong, :pointer], :int
    attach_function :WSAEnumProtocolsA, [:pointer, :pointer, :pointer], :int
    attach_function :WSAEnumProtocolsW, [:pointer, :pointer, :pointer], :int
    attach_function :WSAEventSelect, [:ulong, :ulong, :long], :int
    attach_function :WSAGetLastError, [], :int
    attach_function :WSAGetOverlappedResult, [:ulong, :pointer, :pointer, :bool, :pointer], :bool
    attach_function :WSAGetQOSByName, [:ulong, :pointer, :pointer], :bool
    attach_function :WSAGetServiceClassInfoA, [:pointer, :pointer, :pointer, :pointer], :int
    attach_function :WSAGetServiceClassInfoW, [:pointer, :pointer, :pointer, :pointer], :int
    attach_function :WSAGetServiceClassNameByClassIdA, [:pointer, :pointer, :pointer], :int
    attach_function :WSAGetServiceClassNameByClassIdW, [:pointer, :pointer, :pointer], :int
    attach_function :WSAHtonl, [:ulong, :ulong, :pointer], :int
    attach_function :WSAHtons, [:ulong, :ushort, :pointer], :int
    attach_function :WSAInstallServiceClassA, [:pointer], :int
    attach_function :WSAInstallServiceClassW, [:pointer], :int
    attach_function :WSAIoctl, [:ulong, :ulong, :pointer, :ulong, :pointer, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :WSAJoinLeaf, [:ulong, :pointer, :int, :pointer, :pointer, :pointer, :pointer, :ulong], :ulong
    attach_function :WSALookupServiceBeginA, [:pointer, :ulong, :pointer], :int
    attach_function :WSALookupServiceBeginW, [:pointer, :ulong, :pointer], :int
    attach_function :WSALookupServiceEnd, [:ulong], :int
    attach_function :WSALookupServiceNextA, [:ulong, :ulong, :pointer, :pointer], :int
    attach_function :WSALookupServiceNextW, [:ulong, :ulong, :pointer, :pointer], :int
    attach_function :WSANtohl, [:ulong, :ulong, :pointer], :int
    attach_function :WSANtohs, [:ulong, :ushort, :pointer], :int
    attach_function :WSAProviderConfigChange, [:pointer, :pointer, :pointer], :int
    attach_function :WSARecv, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :WSARecvDisconnect, [:ulong, :pointer], :int
    attach_function :WSARecvFrom, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :WSARemoveServiceClass, [:pointer], :int
    attach_function :WSAResetEvent, [:ulong], :bool
    attach_function :WSASend, [:ulong, :pointer, :ulong, :pointer, :ulong, :pointer, :pointer], :int
    attach_function :WSASendDisconnect, [:ulong, :pointer], :int
    attach_function :WSASendTo, [:ulong, :pointer, :ulong, :pointer, :ulong, :pointer, :int, :pointer, :pointer], :int
    attach_function :WSASetEvent, [:ulong], :bool
    attach_function :WSASetLastError, [:int], :void
    attach_function :WSASetServiceA, [:pointer, :int, :ulong], :int
    attach_function :WSASetServiceW, [:pointer, :int, :ulong], :int
    attach_function :WSAStartup, [:ushort, :pointer], :int
    attach_function :WSASocketA, [:int, :int, :int, :pointer, :ulong, :ulong], :ulong
    attach_function :WSASocketW, [:int, :int, :int, :pointer, :ulong, :ulong], :ulong
    attach_function :WSAStringToAddressA, [:string, :int, :pointer, :pointer, :pointer], :int
    attach_function :WSAStringToAddressW, [:string, :int, :pointer, :pointer, :pointer], :int
    attach_function :WSAWaitForMultipleEvents, [:ulong, :pointer, :bool, :ulong, :bool], :ulong

    begin
      attach_function :WSAEnumNameSpaceProvidersA, [:pointer, :pointer], :int
      attach_function :WSAEnumNameSpaceProvidersW, [:pointer, :pointer], :int
      attach_function :WSANSPIoctl, [:ulong, :ulong, :pointer, :ulong, :pointer, :ulong, :pointer, :pointer], :int
    rescue FFI::NotFoundError
      # XP or later
    end

    begin
      attach_function :WSAConnectByList, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
      attach_function :WSAConnectByName, [:ulong, :string, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
      attach_function :WSAEnumNameSpaceProvidersEx, [:pointer, :pointer], :int
      attach_function :WSAPoll, [:pointer, :ulong, :int], :int
      attach_function :WSASendMsg, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer], :int
    rescue FFI::NotFoundError
      # Vista or later
    end

    ffi_lib 'fwpuclnt'

    begin
      attach_function :WSAImpersonateSocketPeer, [:ulong, :pointer, :ulong], :int
    rescue FFI::NotFoundError
      # XP or later
    end

    begin
      attach_function :WSARevertImpersonation, [:void], :int
      attach_function :WSAQuerySocketSecurity, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :WSADeleteSocketPeerTargetName, [:ulong, :pointer, :ulong, :pointer, :pointer], :int
      attach_function :WSASetSocketPeerTargetName, [:ulong, :pointer, :ulong, :pointer, :pointer], :int
      attach_function :WSASetSocketSecurity, [:ulong, :pointer, :ulong, :pointer, :pointer], :int
    rescue FFI::NotFoundError
      # Vista or later
    end

    ffi_lib 'mswsock'

    attach_function :WSARecvEx, [:ulong, :pointer, :int, :pointer], :int
  end
end
