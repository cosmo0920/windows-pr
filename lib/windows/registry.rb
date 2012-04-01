require 'ffi'

module Windows
  module Registry
    extend FFI::Library
    ffi_lib 'advapi32'

    private

    HKEY_CLASSES_ROOT        = 0x80000000
    HKEY_CURRENT_USER        = 0x80000001
    HKEY_LOCAL_MACHINE       = 0x80000002
    HKEY_USERS               = 0x80000003
    HKEY_PERFORMANCE_DATA    = 0x80000004
    HKEY_PERFORMANCE_TEXT    = 0x80000050
    HKEY_PERFORMANCE_NLSTEXT = 0x80000060
    HKEY_CURRENT_CONFIG      = 0x80000005
    HKEY_DYN_DATA            = 0x80000006

    KEY_QUERY_VALUE         = 0x0001
    KEY_SET_VALUE           = 0x0002
    KEY_CREATE_SUB_KEY      = 0x0004
    KEY_ENUMERATE_SUB_KEYS  = 0x0008
    KEY_NOTIFY              = 0x0010
    KEY_CREATE_LINK         = 0x0020
    KEY_WOW64_32KEY         = 0x0200
    KEY_WOW64_64KEY         = 0x0100
    KEY_WOW64_RES           = 0x0300

    #KEY_READ = (STANDARD_RIGHTS_READ|KEY_QUERY_VALUE|KEY_ENUMERATE_SUB_KEYS|
    #            KEY_NOTIFY) & (~SYNCHRONIZE)

    #KEY_WRITE = (STANDARD_RIGHTS_WRITE|KEY_SET_VALUE|
    #            KEY_CREATE_SUB_KEY) & (~SYNCHRONIZE)

    #KEY_EXECUTE = KEY_READ & (~SYNCHRONIZE)

    #KEY_ALL_ACCESS = (STANDARD_RIGHTS_ALL|KEY_QUERY_VALUE|KEY_SET_VALUE|
    #            KEY_CREATE_SUB_KEY|KEY_ENUMERATE_SUB_KEYS|KEY_NOTIFY|
    #            KEY_CREATE_LINK) & (~SYNCHRONIZE)

    REG_OPTION_RESERVED       = 0
    REG_OPTION_NON_VOLATILE   = 0
    REG_OPTION_VOLATILE       = 1
    REG_OPTION_CREATE_LINK    = 2
    REG_OPTION_BACKUP_RESTORE = 4
    REG_OPTION_OPEN_LINK      = 8

    REG_LEGAL_OPTION = REG_OPTION_RESERVED|REG_OPTION_NON_VOLATILE|
       REG_OPTION_VOLATILE|REG_OPTION_CREATE_LINK|REG_OPTION_BACKUP_RESTORE|
       REG_OPTION_OPEN_LINK

    REG_CREATED_NEW_KEY     = 1
    REG_OPENED_EXISTING_KEY = 2

    REG_STANDARD_FORMAT = 1
    REG_LATEST_FORMAT   = 2
    REG_NO_COMPRESSION  = 4

    REG_WHOLE_HIVE_VOLATILE = 1
    REG_REFRESH_HIVE        = 2
    REG_NO_LAZY_FLUSH       = 4
    REG_FORCE_RESTORE       = 8

    REG_FORCE_UNLOAD = 1

    REG_NOTIFY_CHANGE_NAME        = 1
    REG_NOTIFY_CHANGE_ATTRIBUTES  = 2
    REG_NOTIFY_CHANGE_LAST_SET    = 4
    REG_NOTIFY_CHANGE_SECURITY    = 8

    REG_LEGAL_CHANGE_FILTER = REG_NOTIFY_CHANGE_NAME|
       REG_NOTIFY_CHANGE_ATTRIBUTES|REG_NOTIFY_CHANGE_LAST_SET|
       REG_NOTIFY_CHANGE_SECURITY

    REG_NONE                       = 0
    REG_SZ                         = 1
    REG_EXPAND_SZ                  = 2
    REG_BINARY                     = 3
    REG_DWORD                      = 4
    REG_DWORD_LITTLE_ENDIAN        = 4
    REG_DWORD_BIG_ENDIAN           = 5
    REG_LINK                       = 6
    REG_MULTI_SZ                   = 7
    REG_RESOURCE_LIST              = 8
    REG_FULL_RESOURCE_DESCRIPTOR   = 9
    REG_RESOURCE_REQUIREMENTS_LIST = 10
    REG_QWORD                      = 11
    REG_QWORD_LITTLE_ENDIAN        = 11

    # Registry Routine Flags

    RRF_RT_REG_NONE      = 0x00000001  # restrict type to REG_NONE
    RRF_RT_REG_SZ        = 0x00000002  # restrict type to REG_SZ
    RRF_RT_REG_EXPAND_SZ = 0x00000004  # restrict type to REG_EXPAND_SZ
    RRF_RT_REG_BINARY    = 0x00000008  # restrict type to REG_BINARY
    RRF_RT_REG_DWORD     = 0x00000010  # restrict type to REG_DWORD
    RRF_RT_REG_MULTI_SZ  = 0x00000020  # restrict type to REG_MULTI_SZ
    RRF_RT_REG_QWORD     = 0x00000040  # restrict type to REG_QWORD
    RRF_RT_ANY           = 0x0000ffff
    RRF_NOEXPAND         = 0x10000000
    RRF_ZEROONFAILURE    = 0x20000000
    RRF_RT_DWORD         = (RRF_RT_REG_BINARY | RRF_RT_REG_DWORD)
    RRF_RT_QWORD         = (RRF_RT_REG_BINARY | RRF_RT_REG_QWORD)

    attach_function :RegCloseKey, [:ulong], :long
    attach_function :RegConnectRegistryA, [:string, :ulong, :pointer], :long
    attach_function :RegConnectRegistryW, [:string, :ulong, :pointer], :long
    attach_function :RegCreateKeyA, [:ulong, :string, :pointer], :long
    attach_function :RegCreateKeyW, [:ulong, :string, :pointer], :long
    attach_function :RegCreateKeyExA, [:ulong, :string, :ulong, :string, :ulong, :ulong, :pointer, :pointer, :pointer], :long
    attach_function :RegCreateKeyExW, [:ulong, :string, :ulong, :string, :ulong, :ulong, :pointer, :pointer, :pointer], :long
    attach_function :RegDeleteKeyA, [:ulong, :string], :long
    attach_function :RegDeleteKeyW, [:ulong, :string], :long
    attach_function :RegDeleteValueA, [:ulong, :string], :long
    attach_function :RegDeleteValueW, [:ulong, :string], :long
    attach_function :RegDisablePredefinedCache, [:void], :long
    attach_function :RegEnumKeyA, [:ulong, :ulong, :pointer, :ulong], :long
    attach_function :RegEnumKeyW, [:ulong, :ulong, :pointer, :ulong], :long
    attach_function :RegEnumKeyExA, [:ulong, :ulong, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegEnumKeyExW, [:ulong, :ulong, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegEnumValueA, [:ulong, :ulong, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegEnumValueW, [:ulong, :ulong, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegFlushKey, [:ulong], :long
    attach_function :RegGetKeySecurity, [:ulong, :ulong, :pointer, :pointer], :long
    attach_function :RegLoadKeyA, [:ulong, :string], :string, :long
    attach_function :RegLoadKeyW, [:ulong, :string], :string, :long
    attach_function :RegNotifyChangeKeyValue, [:ulong, :bool, :ulong, :ulong, :bool], :long
    attach_function :RegOpenCurrentUser, [:ulong, :pointer], :long
    attach_function :RegOpenKeyA, [:ulong, :string, :pointer], :long
    attach_function :RegOpenKeyW, [:ulong, :string, :pointer], :long
    attach_function :RegOpenKeyExA, [:ulong, :string, :ulong, :ulong, :pointer], :long
    attach_function :RegOpenKeyExW, [:ulong, :string, :ulong, :ulong, :pointer], :long
    attach_function :RegOpenUserClassesRoot, [:ulong, :ulong, :ulong, :pointer], :long
    attach_function :RegOverridePredefKey, [:ulong, :ulong], :long
    attach_function :RegQueryInfoKeyA, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegQueryInfoKeyW, [:ulong, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegQueryMultipleValuesA, [:ulong, :pointer, :ulong, :pointer, :pointer], :long
    attach_function :RegQueryMultipleValuesW, [:ulong, :pointer, :ulong, :pointer, :pointer], :long
    attach_function :RegQueryValueExA, [:ulong, :string, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegQueryValueExW, [:ulong, :string, :pointer, :pointer, :pointer, :pointer], :long
    attach_function :RegReplaceKeyA, [:ulong, :string, :string, :string], :long
    attach_function :RegReplaceKeyW, [:ulong, :string, :string, :string], :long
    attach_function :RegRestoreKeyA, [:ulong, :string, :ulong], :long
    attach_function :RegRestoreKeyW, [:ulong, :string, :ulong], :long
    attach_function :RegSaveKeyA, [:ulong, :string, :pointer], :long
    attach_function :RegSaveKeyW, [:ulong, :string, :pointer], :long
    attach_function :RegSetKeySecurity, [:ulong, :ulong, :pointer], :long
    attach_function :RegSetValueExA, [:ulong, :string, :ulong, :ulong, :pointer, :ulong], :long
    attach_function :RegSetValueExW, [:ulong, :string, :ulong, :ulong, :pointer, :ulong], :long
    attach_function :RegUnLoadKeyA, [:ulong, :string], :long
    attach_function :RegUnLoadKeyW, [:ulong, :string], :long

    begin
      attach_function :RegGetValueA, [:ulong, :string, :string, :ulong, :pointer, :pointer, :pointer], :long
      attach_function :RegGetValueW, [:ulong, :string, :string, :ulong, :pointer, :pointer, :pointer], :long
    rescue FFI::NotFoundError
      # Windows XP 64 or later
    end

    begin
      attach_function :RegSaveKeyExA, [:ulong, :string, :pointer, :ulong], :long
      attach_function :RegSaveKeyExW, [:ulong, :string, :pointer, :ulong], :long
    rescue FFI::NotFoundError
      # Windows XP or later
    end

    begin
      attach_function :RegDeleteKeyExA, [:ulong, :string, :ulong, :ulong], :long
      attach_function :RegDeleteKeyExW, [:ulong, :string, :ulong, :ulong], :long
      attach_function :RegDisableReflectionKey, [:ulong], :long
      attach_function :RegEnableReflectionKey, [:ulong], :long
      attach_function :RegQueryReflectionKey, [:ulong, :bool], :long
      attach_function :RegCopyTreeA, [:ulong, :string, :ulong], :long
      attach_function :RegCopyTreeW, [:ulong, :string, :ulong], :long

      attach_function :RegCreateKeyTransactedA, [:ulong, :string, :ulong, :string, :ulong, :ulong, :pointer, :pointer, :pointer, :ulong, :pointer], :long
      attach_function :RegCreateKeyTransactedW, [:ulong, :string, :ulong, :string, :ulong, :ulong, :pointer, :pointer, :pointer, :ulong, :pointer], :long

      attach_function :RegDeleteKeyValueA, [:ulong, :string, :string], :long
      attach_function :RegDeleteKeyValueW, [:ulong, :string, :string], :long
      attach_function :RegDeleteTreeA, [:ulong, :string], :long
      attach_function :RegDeleteTreeW, [:ulong, :string], :long
      attach_function :RegDeleteKeyTransactedA, [:ulong, :string, :ulong, :ulong, :ulong, :pointer], :long
      attach_function :RegDeleteKeyTransactedW, [:ulong, :string, :ulong, :ulong, :ulong, :pointer], :long
      attach_function :RegDisablePredefinedCacheEx, [], :long
      attach_function :RegLoadAppKeyA, [:string, :pointer, :ulong, :ulong, :ulong], :long
      attach_function :RegLoadAppKeyW, [:string, :pointer, :ulong, :ulong, :ulong], :long
      attach_function :RegLoadMUIStringA, [:ulong, :string, :string, :ulong, :pointer, :ulong, :string], :long
      attach_function :RegLoadMUIStringW, [:ulong, :string, :string, :ulong, :pointer, :ulong, :string], :long
      attach_function :RegOpenKeyTransactedA, [:ulong, :string, :ulong, :ulong, :pointer, :ulong, :pointer], :long
      attach_function :RegOpenKeyTransactedW, [:ulong, :string, :ulong, :ulong, :pointer, :ulong, :pointer], :long
      attach_function :RegSetKeyValueA, [:ulong, :string, :string, :ulong, :pointer, :ulong], :long
      attach_function :RegSetKeyValueW, [:ulong, :string, :string, :ulong, :pointer, :ulong], :long
    rescue FFI::NotFoundError
      # Windows Vista or later
    end

    ffi_lib :kernel32

    begin
      attach_function :GetSystemRegistryQuota, [:pointer, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows Vista or later
    end
  end
end
