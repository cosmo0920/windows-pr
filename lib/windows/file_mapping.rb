require 'ffi'

module Windows
  module FileMapping     
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    FILE_MAP_COPY       = 0x0001
    FILE_MAP_WRITE      = 0x0002
    FILE_MAP_READ       = 0x0004
    FILE_MAP_ALL_ACCESS = 983071
      
    attach_function :CreateFileMappingA, [:ulong, :pointer, :ulong, :ulong, :ulong, :string], :ulong
    attach_function :CreateFileMappingW, [:ulong, :pointer, :ulong, :ulong, :ulong, :string], :ulong
    attach_function :FlushViewOfFile, [:pointer, :size_t], :bool
    attach_function :MapViewOfFile, [:ulong, :ulong, :ulong, :ulong, :size_t], :ulong
    attach_function :MapViewOfFileEx, [:ulong, :ulong, :ulong, :ulong, :size_t, :ulong], :ulong
    attach_function :OpenFileMappingA, [:ulong, :bool, :string], :ulong
    attach_function :OpenFileMappingW, [:ulong, :bool, :string], :ulong
    attach_function :UnmapViewOfFile, [:pointer], :bool

    if `ver`[/\d.\d/].to_f >= 6.0
      ffi_lib 'psapi'
    end

    attach_function :GetMappedFileNameA, [:ulong, :ulong, :pointer, :ulong], :ulong
    attach_function :GetMappedFileNameW, [:ulong, :ulong, :pointer, :ulong], :ulong
  end
end
