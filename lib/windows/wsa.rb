require 'windows/api'

module Windows
  module WSA
    API.auto_namespace = 'Windows::WSA'
    API.auto_constant  = true
    API.auto_method    = true
    API.auto_unicode   = true

    API.new('WSAAccept', 'LPPKP', 'L', 'ws2_32')
    API.new('WSAAddressToString', 'PLPPP', 'I', 'ws2_32')
    API.new('WSAAsyncGetHostByAddr', 'LISIIPI', 'L', 'ws2_32')
    API.new('WSAAsyncGetHostByName', 'LISPI', 'L', 'ws2_32')
    API.new('WSAAsyncGetProtoByName', 'LISPI', 'L', 'ws2_32')
    API.new('WSAAsyncGetProtoByNumber', 'LISPI', 'L', 'ws2_32')
    API.new('WSAAsyncGetServByName', 'LISSPI', 'L', 'ws2_32')
    API.new('WSAAsyncGetServByPort', 'LIISPI', 'L', 'ws2_32')
    API.new('WSAAsyncSelect', 'LLIL', 'I', 'ws2_32')
    API.new('WSACancelAsyncRequest', 'L', 'I', 'ws2_32')
    API.new('WSACleanup', 'V', 'I', 'ws2_32')
    API.new('WSACloseEvent', 'I', 'B', 'ws2_32')
    API.new('WSAConnect', 'LPIPPPP', 'I', 'ws2_32')
    API.new('WSAConnectByList', 'LPPPPPPP', 'B', 'ws2_32')
    API.new('WSAConnectByName', 'LPPPPPPP', 'B', 'ws2_32')
    API.new('WSACreateEvent', 'V', 'L', 'ws2_32')
    API.new('WSAStartup', 'LP', 'I', 'ws2_32')
  end
end
