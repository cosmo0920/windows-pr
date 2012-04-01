require 'ffi'

module Windows
  module Socket
    extend FFI::Library
    ffi_lib :mswsock

    private

    # Constants

    IPPROTO_IP            = 0         # dummy for IP
    IPPROTO_ICMP          = 1         # control message protocol
    IPPROTO_IGMP          = 2         # group management protocol
    IPPROTO_GGP           = 3         # gateway^2 (deprecated
    IPPROTO_TCP           = 6         # tcp
    IPPROTO_PUP           = 12        # pup
    IPPROTO_UDP           = 17        # user datagram protocol
    IPPROTO_IDP           = 22        # xns idp
    IPPROTO_ND            = 77        # UNOFFICIAL net disk proto
    IPPROTO_RAW           = 255       # raw IP packet
    IPPROTO_MAX           = 256

    NSPROTO_IPX   = 1000
    NSPROTO_SPX   = 1256
    NSPROTO_SPXII = 1257

    # Functions
    attach_function :AcceptEx, [:ulong, :ulong, :pointer, :ulong, :ulong, :ulong, :pointer, :pointer], :bool
    attach_function :EnumProtocolsA, [:pointer, :pointer, :pointer], :int
    attach_function :EnumProtocolsW, [:pointer, :pointer, :pointer], :int
    attach_function :GetAcceptExSockaddrs, [:pointer, :ulong, :ulong, :ulong, :pointer, :pointer, :pointer, :pointer], :void
    attach_function :GetAddressByNameA, [:ulong, :pointer, :pointer, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :GetAddressByNameW, [:ulong, :pointer, :pointer, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :GetNameByTypeA, [:pointer, :pointer, :ulong], :int
    attach_function :GetNameByTypeW, [:pointer, :pointer, :ulong], :int
    attach_function :GetServiceA, [:ulong, :pointer, :string, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :GetServiceW, [:ulong, :pointer, :string, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :GetTypeByNameA, [:string, :pointer], :int
    attach_function :GetTypeByNameW, [:string, :pointer], :int
    attach_function :SetServiceA, [:ulong, :ulong, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :SetServiceW, [:ulong, :ulong, :ulong, :pointer, :pointer, :pointer], :int
    attach_function :TransmitFile, [:ulong, :ulong, :ulong, :ulong, :pointer, :pointer, :ulong], :bool

    ffi_lib :ws2_32

    attach_function :accept, [:ulong, :pointer, :pointer], :ulong
    attach_function :bind, [:ulong, :pointer, :int], :int
    attach_function :closesocket, [:ulong], :int
    attach_function :connect, [:ulong, :pointer, :int], :int
    attach_function :gethostbyaddr, [:string, :int, :int], :pointer
    attach_function :gethostbyname, [:string], :pointer
    attach_function :gethostname, [:pointer, :int], :int
    attach_function :getpeername, [:ulong, :pointer, :pointer], :int
    attach_function :getprotobyname, [:string], :pointer
    attach_function :getprotobynumber, [:int], :pointer
    attach_function :getservbyport, [:int, :string], :pointer
    attach_function :getsockname, [:ulong, :pointer, :pointer], :int
    attach_function :getsockopt, [:ulong, :int, :int, :pointer, :pointer], :int
    attach_function :htonl, [:ulong], :ulong
    attach_function :htons, [:ushort], :ushort
    attach_function :inet_addr, [:string], :ulong
    attach_function :inet_ntoa, [:pointer], :string
    attach_function :ioctlsocket, [:ulong, :ulong, :pointer], :int
    attach_function :listen, [:ulong, :int], :int
    attach_function :ntohl, [:ulong], :ulong
    attach_function :ntohs, [:ushort], :ushort
    attach_function :recv, [:ulong, :pointer, :int, :int], :int
    attach_function :recvfrom, [:ulong, :pointer, :int, :int, :pointer, :pointer], :int
    attach_function :send, [:ulong, :string, :int, :int], :int
    attach_function :sendto, [:ulong, :string, :int, :int, :pointer, :int], :int
    attach_function :setsockopt, [:ulong, :int, :int, :string, :int], :int
    attach_function :shutdown, [:ulong, :int], :int
    attach_function :socket, [:int, :int, :int], :ulong

    begin
      attach_function :freeaddrinfo, [:pointer], :void
      attach_function :FreeAddrInfoEx, [:pointer], :void
      attach_function :FreeAddrInfoW, [:pointer], :void
      attach_function :getaddrinfo, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :GetAddrInfoEx, [:pointer, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :GetAddrInfoW, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :getnameinfo, [:pointer, :ulong, :pointer, :ulong, :pointer, :ulong, :int], :int
      attach_function :GetNameInfoW, [:pointer, :ulong, :pointer, :ulong, :pointer, :ulong, :int], :int
      attach_function :InetNtop, [:int, :pointer, :pointer, :size_t], :pointer
      attach_function :inet_pton, [:int, :pointer, :pointer], :int
      attach_function :SetAddrInfoEx, [:string, :string, :pointer, :ulong, :pointer, :ulong, :ulong, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    rescue FFI::NotFoundError
      # XP or later
    end
  end
end
