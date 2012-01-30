require 'ffi'

# In general you will want to use this module with Windows::National because
# it contains the various LOCALE and TIME constants.

module Windows
  module Time
    extend FFI::Library
    ffi_lib 'kernel32'

    private
    
    TIME_ZONE_ID_UNKNOWN  = 0
    TIME_ZONE_ID_STANDARD = 1
    TIME_ZONE_ID_DAYLIGHT = 2      

    attach_function :CompareFileTime, [:pointer, :pointer], :long
    attach_function :DosDateTimeToFileTime, [:ushort, :ushort], :bool
    attach_function :FileTimeToDosDateTime, [:pointer, :pointer, :pointer], :bool
    attach_function :FileTimeToLocalFileTime, [:pointer, :pointer], :bool
    attach_function :FileTimeToSystemTime, [:pointer, :pointer], :bool
    attach_function :GetFileTime, [:ulong, :pointer, :pointer, :pointer], :bool
    attach_function :GetLocalTime, [:pointer], :void
    attach_function :GetSystemTime, [:pointer], :void
    attach_function :GetSystemTimeAdjustment, [:pointer, :pointer, :pointer], :bool
    attach_function :GetSystemTimeAsFileTime, [:pointer], :void
    attach_function :GetTickCount, [], :ulong
    attach_function :GetTimeFormatA, [:ulong, :ulong, :pointer, :string, :pointer, :int], :int
    attach_function :GetTimeFormatW, [:ulong, :ulong, :pointer, :string, :pointer, :int], :int
    attach_function :GetTimeZoneInformation, [:pointer], :ulong
    attach_function :LocalFileTimeToFileTime, [:pointer, :pointer], :bool
    attach_function :SetFileTime, [:ulong, :pointer, :pointer, :pointer], :bool
    attach_function :SetLocalTime, [:pointer], :bool
    attach_function :SetSystemTime, [:pointer], :bool
    attach_function :SetTimeZoneInformation, [:pointer], :bool
    attach_function :SetSystemTimeAdjustment, [:ulong, :bool], :bool
    attach_function :SystemTimeToFileTime, [:pointer, :pointer], :bool
    attach_function :SystemTimeToTzSpecificLocalTime, [:pointer, :pointer, :pointer], :bool

    begin
      attach_function :GetSystemTimes, [:pointer, :pointer, :pointer], :bool
      attach_function :TzSpecificLocalTimeToSystemTime, [:pointer, :pointer, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
