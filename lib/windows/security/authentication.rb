require 'ffi'

module Windows
  module Security
    module Authentication
      extend FFI::Library
      ffi_lib 'advapi32'

      private

      POLICY_VIEW_LOCAL_INFORMATION   = 0x00000001
      POLICY_VIEW_AUDIT_INFORMATION   = 0x00000002
      POLICY_GET_PRIVATE_INFORMATION  = 0x00000004
      POLICY_TRUST_ADMIN              = 0x00000008
      POLICY_CREATE_ACCOUNT           = 0x00000010
      POLICY_CREATE_SECRET            = 0x00000020
      POLICY_CREATE_PRIVILEGE         = 0x00000040
      POLICY_SET_DEFAULT_QUOTA_LIMITS = 0x00000080
      POLICY_SET_AUDIT_REQUIREMENTS   = 0x00000100
      POLICY_AUDIT_LOG_ADMIN          = 0x00000200
      POLICY_SERVER_ADMIN             = 0x00000400
      POLICY_LOOKUP_NAMES             = 0x00000800
      POLICY_NOTIFICATION             = 0x00001000

      attach_function :LsaOpenPolicy, [:pointer, :pointer, :ulong, :pointer], :ulong
      attach_function :LsaClose, [:ulong], :ulong
      attach_function :LsaNtStatusToWinError, [:ulong], :ulong
    end
  end
end
