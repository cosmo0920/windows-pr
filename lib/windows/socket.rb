require 'windows/api'

module Windows
  module Socket
    API.auto_namespace = 'Windows::Socket'
    API.auto_constant  = true
    API.auto_method    = true
    API.auto_unicode   = true

    # Constants

    IPPROTO_IP            = 0         # dummy for IP
    IPPROTO_ICMP          = 1         # control message protocol
    IPPROTO_IGMP          = 2         # group management protocol
    IPPROTO_GGP           = 3         # gateway^2 (deprecated)
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

    API.new('accept', 'LPP', 'L', 'ws2_32')
    API.new('AcceptEx', 'LLPLLLPP', 'B', 'mswsock')
    API.new('bind', 'LPI', 'I', 'ws2_32')
    API.new('closesocket', 'L', 'I', 'ws2_32')
    API.new('connect', 'LPI', 'I', 'ws2_32')
    API.new('EnumProtocols', 'PPP', 'I', 'mswsock')
    API.new('freeaddrinfo', 'P', 'V', 'ws2_32')
  end
end
