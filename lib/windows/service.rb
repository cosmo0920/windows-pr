require 'ffi'

module Windows
  module Service
    extend FFI::Library
    ffi_lib 'advapi32'

    private

    # SCM access rights
    SC_MANAGER_ALL_ACCESS         = 0xF003F
    SC_MANAGER_CREATE_SERVICE     = 0x0002
    SC_MANAGER_CONNECT            = 0x0001
    SC_MANAGER_ENUMERATE_SERVICE  = 0x0004
    SC_MANAGER_LOCK               = 0x0008
    SC_MANAGER_MODIFY_BOOT_CONFIG = 0x0020
    SC_MANAGER_QUERY_LOCK_STATUS  = 0x0010
    SC_STATUS_PROCESS_INFO        = 0
    SC_ENUM_PROCESS_INFO          = 0
    
    # Service control action types
    SC_ACTION_NONE        = 0
    SC_ACTION_RESTART     = 1
    SC_ACTION_REBOOT      = 2
    SC_ACTION_RUN_COMMAND = 3

    # Service access rights
    SERVICE_ALL_ACCESS            = 0xF01FF
    SERVICE_CHANGE_CONFIG         = 0x0002
    SERVICE_ENUMERATE_DEPENDENTS  = 0x0008
    SERVICE_INTERROGATE           = 0x0080
    SERVICE_PAUSE_CONTINUE        = 0x0040
    SERVICE_QUERY_CONFIG          = 0x0001
    SERVICE_QUERY_STATUS          = 0x0004
    SERVICE_START                 = 0x0010
    SERVICE_STOP                  = 0x0020
    SERVICE_USER_DEFINED_CONTROL  = 0x0100

    # Service types
    SERVICE_KERNEL_DRIVER       = 0x00000001
    SERVICE_FILE_SYSTEM_DRIVER  = 0x00000002
    SERVICE_ADAPTER             = 0x00000004
    SERVICE_RECOGNIZER_DRIVER   = 0x00000008
    SERVICE_WIN32_OWN_PROCESS   = 0x00000010
    SERVICE_WIN32_SHARE_PROCESS = 0x00000020
    SERVICE_WIN32               = 0x00000030
    SERVICE_INTERACTIVE_PROCESS = 0x00000100
    SERVICE_DRIVER              = 0x0000000B
    SERVICE_TYPE_ALL            = 0x0000013F

    # Error control
    SERVICE_ERROR_IGNORE   = 0x00000000
    SERVICE_ERROR_NORMAL   = 0x00000001
    SERVICE_ERROR_SEVERE   = 0x00000002
    SERVICE_ERROR_CRITICAL = 0x00000003

    # Start types
    SERVICE_BOOT_START   = 0x00000000
    SERVICE_SYSTEM_START = 0x00000001
    SERVICE_AUTO_START   = 0x00000002
    SERVICE_DEMAND_START = 0x00000003
    SERVICE_DISABLED     = 0x00000004

    # Service control
    SERVICE_CONTROL_STOP           = 0x00000001
    SERVICE_CONTROL_PAUSE          = 0x00000002
    SERVICE_CONTROL_CONTINUE       = 0x00000003
    SERVICE_CONTROL_INTERROGATE    = 0x00000004
    SERVICE_CONTROL_PARAMCHANGE    = 0x00000006
    SERVICE_CONTROL_NETBINDADD     = 0x00000007
    SERVICE_CONTROL_NETBINDREMOVE  = 0x00000008
    SERVICE_CONTROL_NETBINDENABLE  = 0x00000009
    SERVICE_CONTROL_NETBINDDISABLE = 0x0000000A
    
    # Service controls accepted
    SERVICE_ACCEPT_STOP                  =  0x00000001
    SERVICE_ACCEPT_PAUSE_CONTINUE        =  0x00000002
    SERVICE_ACCEPT_SHUTDOWN              =  0x00000004
    SERVICE_ACCEPT_PARAMCHANGE           =  0x00000008
    SERVICE_ACCEPT_NETBINDCHANGE         =  0x00000010
    SERVICE_ACCEPT_HARDWAREPROFILECHANGE =  0x00000020
    SERVICE_ACCEPT_POWEREVENT            =  0x00000040
    SERVICE_ACCEPT_SESSIONCHANGE         =  0x00000080
    SERVICE_ACCEPT_PRESHUTDOWN           =  0x00000100

    # Service states
    SERVICE_ACTIVE    = 0x00000001
    SERVICE_INACTIVE  = 0x00000002
    SERVICE_STATE_ALL = 0x00000003
    
    # Service current states
    SERVICE_STOPPED          = 0x00000001
    SERVICE_START_PENDING    = 0x00000002
    SERVICE_STOP_PENDING     = 0x00000003
    SERVICE_RUNNING          = 0x00000004
    SERVICE_CONTINUE_PENDING = 0x00000005
    SERVICE_PAUSE_PENDING    = 0x00000006
    SERVICE_PAUSED           = 0x00000007
    
    # Info levels
    SERVICE_CONFIG_DESCRIPTION              = 1
    SERVICE_CONFIG_FAILURE_ACTIONS          = 2
    SERVICE_CONFIG_DELAYED_AUTO_START_INFO  = 3
    SERVICE_CONFIG_FAILURE_ACTIONS_FLAG     = 4
    SERVICE_CONFIG_SERVICE_SID_INFO         = 5
    SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6
    SERVICE_CONFIG_PRESHUTDOWN_INFO         = 7
    
    # Configuration
    SERVICE_NO_CHANGE = 0xffffffff

    class SERVICE_STATUS < FFI::Struct
      layout(
        :dwServiceType, :ulong,
        :dwCurrentState, :ulong,
        :dwControlsAccepted, :ulong,
        :dwWin32ExitCode, :ulong,
        :dwServiceSpecificExitCode, :ulong,
        :dwCheckPoint, :ulong,
        :dwWaitHint, :ulong
      )
    end
    
    attach_function :ChangeServiceConfigA, [:ulong, :ulong, :ulong, :ulong, :string,
      :string, :pointer, :string, :string, :string, :string, :string], :bool
    attach_function :ChangeServiceConfigW, [:ulong, :ulong, :ulong, :ulong, :string,
      :string, :pointer, :string, :string, :string, :string, :string], :bool

    attach_function :ChangeServiceConfig2A, [:ulong, :ulong, :pointer], :bool
    attach_function :ChangeServiceConfig2W, [:ulong, :ulong, :pointer], :bool
    attach_function :CloseServiceHandle, [:ulong], :bool
    attach_function :ControlService, [:ulong, :ulong, :pointer], :bool

    attach_function :CreateServiceA, [:ulong, :string, :string, :ulong, :ulong,
      :ulong, :ulong, :string, :string, :pointer, :string, :string, :string], :ulong
    attach_function :CreateServiceW, [:ulong, :string, :string, :ulong, :ulong,
      :ulong, :ulong, :string, :string, :pointer, :string, :string, :string], :ulong

    attach_function :DeleteService, [:ulong], :bool
    attach_function :EnumDependentServicesA, [:ulong, :ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :EnumDependentServicesW, [:ulong, :ulong, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :EnumServicesStatusA, [:ulong, :ulong, :ulong, :pointer, :ulong, :pointer, :pointer, :pointer], :bool
    attach_function :EnumServicesStatusW, [:ulong, :ulong, :ulong, :pointer, :ulong, :pointer, :pointer, :pointer], :bool

    attach_function :EnumServicesStatusExA, [:ulong, :ulong, :ulong, :ulong, :pointer, :ulong,
      :pointer, :pointer, :pointer, :string], :bool
    attach_function :EnumServicesStatusExW, [:ulong, :ulong, :ulong, :ulong, :pointer, :ulong,
      :pointer, :pointer, :pointer, :string], :bool

    attach_function :GetServiceDisplayNameA, [:ulong, :string, :pointer, :pointer], :bool
    attach_function :GetServiceDisplayNameW, [:ulong, :string, :pointer, :pointer], :bool
    attach_function :GetServiceKeyNameA, [:ulong, :string, :pointer, :pointer], :bool
    attach_function :GetServiceKeyNameW, [:ulong, :string, :pointer, :pointer], :bool
    attach_function :LockServiceDatabase, [:ulong], :ulong
    attach_function :NotifyBootConfigStatus, [:bool], :bool
    attach_function :OpenSCManagerA, [:string, :string, :ulong], :ulong
    attach_function :OpenSCManagerW, [:string, :string, :ulong], :ulong
    attach_function :OpenServiceA, [:ulong, :string, :ulong], :ulong
    attach_function :OpenServiceW, [:ulong, :string, :ulong], :ulong
    attach_function :QueryServiceConfigA, [:ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceConfigW, [:ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceConfig2A, [:ulong, :ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceConfig2W, [:ulong, :ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceLockStatusA, [:ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceLockStatusW, [:ulong, :pointer, :ulong, :pointer], :bool
    attach_function :QueryServiceStatus, [:ulong, :pointer], :bool
    attach_function :QueryServiceStatusEx, [:ulong, :ulong, :pointer, :ulong, :pointer], :bool
    attach_function :RegisterServiceCtrlHandlerA, [:string, :pointer], :ulong # callback
    attach_function :RegisterServiceCtrlHandlerW, [:string, :pointer], :ulong # callback
    attach_function :RegisterServiceCtrlHandlerExA, [:string, :pointer, :pointer], :ulong # callback
    attach_function :RegisterServiceCtrlHandlerExW, [:string, :pointer, :pointer], :ulong # callback
    attach_function :SetServiceBits, [:ulong, :ulong, :bool, :bool], :bool
    attach_function :SetServiceStatus, [:ulong, :pointer], :bool
    attach_function :StartServiceA, [:ulong, :ulong, :pointer], :bool
    attach_function :StartServiceW, [:ulong, :ulong, :pointer], :bool
    attach_function :StartServiceCtrlDispatcherA, [:pointer], :bool
    attach_function :StartServiceCtrlDispatcherW, [:pointer], :bool
    attach_function :UnlockServiceDatabase, [:ulong], :bool

    begin
      attach_function :ControlServiceExA, [:ulong, :ulong, :ulong, :pointer], :bool
      attach_function :ControlServiceExW, [:ulong, :ulong, :ulong, :pointer], :bool
      attach_function :NotifyServiceStatusChangeA, [:ulong, :ulong, :pointer], :ulong
      attach_function :NotifyServiceStatusChangeW, [:ulong, :ulong, :pointer], :ulong
    rescue FFI::NotFoundError
      # Vista or later
    end
  end
end
