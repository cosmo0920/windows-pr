require 'ffi'

module Windows
  module Volume
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    DRIVE_UNKNOWN     = 0
    DRIVE_NO_ROOT_DIR = 1
    DRIVE_REMOVABLE   = 2
    DRIVE_FIXED       = 3
    DRIVE_REMOTE      = 4
    DRIVE_CDROM       = 5
    DRIVE_RAMDISK     = 6
    
    attach_function :DefineDosDeviceA, [:pointer, :string, :string], :bool
    attach_function :DefineDosDeviceW, [:pointer, :string, :string], :bool
    attach_function :DeleteVolumeMountPointA, [:string], :bool
    attach_function :DeleteVolumeMountPointW, [:string], :bool
    attach_function :FindFirstVolumeA, [:pointer, :ulong], :ulong
    attach_function :FindFirstVolumeW, [:pointer, :ulong], :ulong
    attach_function :FindFirstVolumeMountPointA, [:string, :pointer, :ulong], :ulong
    attach_function :FindFirstVolumeMountPointW, [:string, :pointer, :ulong], :ulong
    attach_function :FindNextVolumeA, [:ulong, :pointer, :ulong], :bool
    attach_function :FindNextVolumeW, [:ulong, :pointer, :ulong], :bool
    attach_function :FindNextVolumeMountPointA, [:ulong, :pointer, :ulong], :bool
    attach_function :FindNextVolumeMountPointW, [:ulong, :pointer, :ulong], :bool
    attach_function :FindVolumeClose, [:ulong], :bool
    attach_function :FindVolumeMountPointClose, [:ulong], :bool
    attach_function :GetDriveTypeA, [:string], :uint
    attach_function :GetDriveTypeW, [:string], :uint
    attach_function :GetLogicalDrives, [], :ulong
    attach_function :GetLogicalDriveStringsA, [:ulong, :pointer], :ulong
    attach_function :GetLogicalDriveStringsW, [:ulong, :pointer], :ulong
    attach_function :GetVolumeInformationA, [:string, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :ulong], :bool
    attach_function :GetVolumeInformationW, [:string, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :ulong], :bool
    attach_function :GetVolumeNameForVolumeMountPointA, [:string, :pointer, :ulong], :bool
    attach_function :GetVolumeNameForVolumeMountPointW, [:string, :pointer, :ulong], :bool
    attach_function :GetVolumePathNameA, [:string, :pointer, :ulong], :bool
    attach_function :GetVolumePathNameW, [:string, :pointer, :ulong], :bool
    attach_function :QueryDosDeviceA, [:string, :pointer, :ulong], :ulong
    attach_function :QueryDosDeviceW, [:string, :pointer, :ulong], :ulong
    attach_function :SetVolumeLabelA, [:string, :string], :bool
    attach_function :SetVolumeLabelW, [:string, :string], :bool
    attach_function :SetVolumeMountPointA, [:string, :string], :bool
    attach_function :SetVolumeMountPointW, [:string, :string], :bool

    begin
      attach_function :GetVolumePathNamesForVolumeName, [:string, :pointer, :ulong, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end

    begin
       attach_function :GetVolumeInformationByHandleW, [:ulong, :pointer, :ulong, :pointer, :pointer, :pointer, :pointer, :ulong], :bool
    rescue FFI::NotFoundError
       # Windows Vista or later
    end

    # Returns the volume type for +vol+ or the volume of the current process
    # if no volume is specified.
    #
    # Returns nil if the function fails for any reason.
    #
    def get_volume_type(vol = nil)
      buf = FFI::MemoryPointer.new(:char, 256)
      bool = GetVolumeInformationA(vol, nil, 0, nil, nil, nil, buf, buf.size)
      bool ? buf.read_string : nil
    end
  end
end
