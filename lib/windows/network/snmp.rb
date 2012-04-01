require 'ffi'

module Windows
  module Network
    module SNMP
      extend FFI::Library
      ffi_lib :wsnmp32

      private

      SNMPAPI_FAILURE            = 0
      SNMPAPI_SUCCESS            = 1
      SNMPAPI_ALLOC_ERROR        = 2
      SNMPAPI_CONTEXT_INVALID    = 3
      SNMPAPI_CONTEXT_UNKNOWN    = 4
      SNMPAPI_ENTITY_INVALID     = 5
      SNMPAPI_ENTITY_UNKNOWN     = 6
      SNMPAPI_INDEX_INVALID      = 7
      SNMPAPI_NOOP               = 8
      SNMPAPI_OID_INVALID        = 9
      SNMPAPI_OPERATION_INVALID  = 10
      SNMPAPI_OUTPUT_TRUNCATED   = 11
      SNMPAPI_PDU_INVALID        = 12
      SNMPAPI_SESSION_INVALID    = 13
      SNMPAPI_SYNTAX_INVALID     = 14
      SNMPAPI_VBL_INVALID        = 15
      SNMPAPI_MODE_INVALID       = 16
      SNMPAPI_SIZE_INVALID       = 17
      SNMPAPI_NOT_INITIALIZED    = 18
      SNMPAPI_MESSAGE_INVALID    = 19
      SNMPAPI_HWND_INVALID       = 20
      SNMPAPI_OTHER_ERROR        = 99
      SNMPAPI_TL_NOT_INITIALIZED = 100
      SNMPAPI_TL_NOT_SUPPORTED   = 101
      SNMPAPI_TL_NOT_AVAILABLE   = 102
      SNMPAPI_TL_RESOURCE_ERROR  = 103
      SNMPAPI_TL_UNDELIVERABLE   = 104
      SNMPAPI_TL_SRC_INVALID     = 105
      SNMPAPI_TL_INVALID_PARAM   = 106
      SNMPAPI_TL_IN_USE          = 107
      SNMPAPI_TL_TIMEOUT         = 108
      SNMPAPI_TL_PDU_TOO_BIG     = 109
      SNMPAPI_TL_OTHER           = 199

      SNMPAPI_TRANSLATED       =  0
      SNMPAPI_UNTRANSLATED_V1  =  1
      SNMPAPI_UNTRANSLATED_V2  =  2
      SNMPAPI_NO_SUPPORT       =  0
      SNMPAPI_V1_SUPPORT       =  1
      SNMPAPI_V2_SUPPORT       =  2
      SNMPAPI_M2M_SUPPORT      =  3
      SNMPAPI_OFF              =  0
      SNMPAPI_ON               =  1

      attach_function :SnmpCancelMsg, [:ulong, :ulong], :uint
      attach_function :SnmpCleanup, [], :uint
      attach_function :SnmpClose, [:ulong], :uint
      attach_function :SnmpContextToStr, [:ulong, :pointer], :uint
      attach_function :SnmpDecodeMsg, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer], :uint
      attach_function :SnmpEncodeMsg, [:ulong, :ulong, :ulong, :ulong, :ulong, :pointer], :uint
      attach_function :SnmpEntityToStr, [:ulong, :ulong, :pointer], :uint
      attach_function :SnmpFreeContext, [:ulong], :uint
      attach_function :SnmpFreeDescriptor, [:ulong, :pointer], :uint
      attach_function :SnmpFreeEntity, [:ulong], :uint
      attach_function :SnmpGetLastError, [:ulong], :uint
      attach_function :SnmpListen, [:ulong, :ulong], :uint
      attach_function :SnmpOidCompare, [:pointer, :pointer, :ulong, :pointer], :uint
      attach_function :SnmpOidCopy, [:pointer, :pointer], :uint
      attach_function :SnmpOidToStr, [:pointer, :ulong, :pointer], :uint
      attach_function :SnmpOpen, [:ulong, :uint], :uint
      attach_function :SnmpRecvMsg, [:ulong, :pointer, :pointer, :pointer, :pointer], :uint
      attach_function :SnmpRegister, [:ulong, :ulong, :ulong, :ulong, :pointer, :ulong], :uint
      attach_function :SnmpSendMsg, [:ulong, :ulong, :ulong, :ulong, :ulong], :uint
      attach_function :SnmpSetPort, [:ulong, :uint], :uint
      attach_function :SnmpStartup, [:pointer, :pointer, :pointer, :pointer, :pointer], :uint
      attach_function :SnmpStrToContext, [:ulong, :pointer], :uint
      attach_function :SnmpStrToEntity, [:ulong, :string], :uint
      attach_function :SnmpStrToOid, [:string, :pointer], :uint

      # Windows 2003 Server or later and/or WinSNMP 2.0 or later
      begin
        attach_function :SnmpCreateSession, [:ulong, :uint, :pointer, :pointer], :uint # callback
        attach_function :SnmpCleanupEx, [], :uint
        attach_function :SnmpStartupEx, [:pointer, :pointer, :pointer, :pointer, :pointer], :uint
      rescue FFI::NotFoundError
        # Do nothing. Its up to you to check for their existence.
      end
    end
  end
end
