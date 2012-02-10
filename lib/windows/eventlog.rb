require 'ffi'

module Windows
  module EventLog
    extend FFI::Library
    ffi_lib 'advapi32'

    private

    EVENTLOG_SEQUENTIAL_READ = 0x0001
    EVENTLOG_SEEK_READ       = 0x0002
    EVENTLOG_FORWARDS_READ   = 0x0004
    EVENTLOG_BACKWARDS_READ  = 0x0008

    EVENTLOG_SUCCESS          = 0x0000
    EVENTLOG_ERROR_TYPE       = 0x0001
    EVENTLOG_WARNING_TYPE     = 0x0002
    EVENTLOG_INFORMATION_TYPE = 0x0004
    EVENTLOG_AUDIT_SUCCESS    = 0x0008
    EVENTLOG_AUDIT_FAILURE    = 0x0010

    EVENTLOG_FULL_INFO = 0

    attach_function :BackupEventLogA, [:ulong, :string], :bool
    attach_function :BackupEventLogW, [:ulong, :string], :bool
    attach_function :ClearEventLogA, [:ulong, :string], :bool
    attach_function :ClearEventLogW, [:ulong, :string], :bool
    attach_function :CloseEventLog, [:ulong], :bool
    attach_function :DeregisterEventSource, [:ulong], :bool
    attach_function :GetEventLogInformation, [:ulong, :ulong, :pointer, :ulong, :pointer], :bool
    attach_function :GetNumberOfEventLogRecords, [:ulong, :pointer], :bool
    attach_function :GetOldestEventLogRecord, [:ulong, :pointer], :bool
    attach_function :NotifyChangeEventLog, [:ulong, :ulong], :bool
    attach_function :OpenBackupEventLogA, [:string, :string], :ulong
    attach_function :OpenBackupEventLogW, [:string, :string], :ulong
    attach_function :OpenEventLogA, [:string, :string], :ulong
    attach_function :OpenEventLogW, [:string, :string], :ulong
    attach_function :ReadEventLogA, [:ulong, :ulong, :ulong, :pointer, :ulong, :ulong, :ulong], :bool
    attach_function :ReadEventLogW, [:ulong, :ulong, :ulong, :pointer, :ulong, :ulong, :ulong], :bool
    attach_function :RegisterEventSourceA, [:string, :string], :ulong
    attach_function :RegisterEventSourceW, [:string, :string], :ulong
    attach_function :ReportEventA, [:ulong, :ushort, :ushort, :ulong, :pointer, :ushort, :ulong, :pointer, :pointer], :bool
    attach_function :ReportEventW, [:ulong, :ushort, :ushort, :ulong, :pointer, :ushort, :ulong, :pointer, :pointer], :bool

    begin
      ffi_lib 'wevtapi'
      attach_function :EvtArchiveExportedLog, [:ulong, :string, :ulong, :ulong], :bool
      attach_function :EvtCancel, [:ulong], :bool
      attach_function :EvtClearLog, [:ulong, :string, :string, :ulong], :bool
      attach_function :EvtClose, [:ulong, :bool], :bool
      attach_function :EvtCreateBookmark, [:string], :ulong
      attach_function :EvtCreateRenderContext, [:ulong, :pointer, :ulong], :ulong
      attach_function :EvtExportLog, [:ulong, :string, :string, :string, :ulong], :bool
      attach_function :EvtFormatMessage, [:ulong, :ulong, :ulong, :ulong, :pointer, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetChannelConfigProperty, [:ulong, :ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetEventInfo, [:ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetEventMetadataProperty, [:ulong, :ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetExtendedStatus, [:ulong, :pointer, :pointer], :ulong
      attach_function :EvtGetLogInfo, [:ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetObjectArrayProperty, [:ulong, :ulong, :ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetObjectArraySize, [:ulong, :pointer], :bool
      attach_function :EvtGetPublisherMetadataProperty, [:ulong, :ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtGetQueryInfo, [:ulong, :ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtNext, [:ulong, :ulong, :pointer, :ulong, :ulong, :pointer], :bool
      attach_function :EvtNextChannelPath, [:ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtNextEventMetadata, [:ulong, :ulong], :ulong
      attach_function :EvtNextPublisherId, [:ulong, :ulong, :pointer, :pointer], :bool
      attach_function :EvtOpenChannelConfig, [:ulong, :string, :ulong], :ulong
      attach_function :EvtOpenChannelEnum, [:ulong, :ulong], :ulong
      attach_function :EvtOpenEventMetadataEnum, [:ulong, :ulong], :ulong
      attach_function :EvtOpenLog, [:ulong, :string, :ulong], :ulong
      attach_function :EvtOpenPublisherEnum, [:ulong, :ulong], :ulong
      attach_function :EvtOpenPublisherMetadata, [:ulong, :string, :string, :ulong, :ulong], :ulong
      attach_function :EvtOpenSession, [:ulong, :ulong, :ulong, :ulong], :ulong
      attach_function :EvtQuery, [:ulong, :string, :string, :ulong], :ulong
      attach_function :EvtRender, [:ulong, :ulong, :ulong, :ulong, :pointer, :pointer, :pointer], :bool
      attach_function :EvtSaveChannelConfig, [:ulong, :ulong], :bool
      attach_function :EvtSeek, [:ulong, :ulong, :ulong, :ulong, :ulong], :bool
      attach_function :EvtSetChannelConfigProperty, [:ulong, :ulong, :ulong, :pointer], :bool
      attach_function :EvtSubscribe, [:ulong, :ulong, :string, :string, :ulong, :pointer, :pointer, :ulong], :ulong # callback
      attach_function :EvtUpdateBookmark, [:ulong, :ulong], :bool
    rescue FFI::NotFoundError
      # Windows Vista or later
    end
  end
end
