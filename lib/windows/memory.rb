require 'ffi'

module Windows
  module Memory
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    GHND          = 0x0042
    GMEM_FIXED    = 0x0000
    GMEM_MOVABLE  = 0002
    GMEM_ZEROINIT = 0x0040
    GPTR          = 0x0040

    HEAP_NO_SERIALIZE          = 0x00000001
    HEAP_GENERATE_EXCEPTIONS   = 0x00000004
    HEAP_ZERO_MEMORY           = 0x00000008
    HEAP_REALLOC_IN_PLACE_ONLY = 0x00000010
    HEAP_CREATE_ENABLE_EXECUTE = 0x00040000

    MEM_COMMIT      = 0x1000
    MEM_RESERVE     = 0x2000
    MEM_DECOMMIT    = 0x4000
    MEM_RELEASE     = 0x8000
    MEM_FREE        = 0x10000
    MEM_PRIVATE     = 0x20000
    MEM_MAPPED      = 0x40000
    MEM_RESET       = 0x80000
    MEM_TOP_DOWN    = 0x100000
    MEM_WRITE_WATCH = 0x200000
    MEM_PHYSICAL    = 0x400000
    MEM_LARGE_PAGES = 0x20000000
    MEM_4MB_PAGES   = 0x80000000200000

    PAGE_NOACCESS          = 0x01
    PAGE_READONLY          = 0x02
    PAGE_READWRITE         = 0x04
    PAGE_WRITECOPY         = 0x08
    PAGE_EXECUTE           = 0x10
    PAGE_EXECUTE_READ      = 0x20
    PAGE_EXECUTE_READWRITE = 0x40
    PAGE_EXECUTE_WRITECOPY = 0x80
    PAGE_GUARD             = 0x100
    PAGE_NOCACHE           = 0x200
    PAGE_WRITECOMBINE      = 0x400

    SEC_FILE     = 0x800000
    SEC_IMAGE    = 0x1000000
    SEC_VLM      = 0x2000000
    SEC_RESERVE  = 0x4000000
    SEC_COMMIT   = 0x8000000
    SEC_NOCACHE  = 0x10000000

    LMEM_FIXED          = 0x0000
    LMEM_MOVEABLE       = 0x0002
    LMEM_NOCOMPACT      = 0x0010
    LMEM_NODISCARD      = 0x0020
    LMEM_ZEROINIT       = 0x0040
    LMEM_MODIFY         = 0x0080
    LMEM_DISCARDABLE    = 0x0F00
    LMEM_VALID_FLAGS    = 0x0F72
    LMEM_INVALID_HANDLE = 0x8000
    LMEM_DISCARDED      = 0x4000
    LMEM_LOCKCOUNT      = 0x00FF

    attach_function :GlobalAlloc, [:uint, :size_t], :ulong
    attach_function :GlobalFlags, [:ulong], :uint
    attach_function :GlobalFree, [:ulong], :ulong
    attach_function :GlobalHandle, [:pointer], :ulong
    attach_function :GlobalLock, [:ulong], :ulong
    attach_function :GlobalMemoryStatus, [:pointer], :void
    attach_function :GlobalMemoryStatusEx, [:pointer], :bool
    attach_function :GlobalReAlloc, [:ulong, :size_t, :uint], :ulong
    attach_function :GlobalSize, [:ulong], :size_t
    attach_function :GlobalUnlock, [:ulong], :bool

    attach_function :GetProcessHeap, [:void], :ulong
    attach_function :GetProcessHeaps, [:ulong, :pointer], :ulong
    attach_function :HeapAlloc, [:ulong, :ulong, :size_t], :pointer
    attach_function :HeapCompact, [:ulong, :ulong], :size_t
    attach_function :HeapCreate, [:ulong, :size_t, :size_t], :ulong
    attach_function :HeapDestroy, [:ulong], :bool
    attach_function :HeapFree, [:ulong, :ulong, :pointer], :bool
    attach_function :HeapLock, [:ulong], :bool
    attach_function :HeapReAlloc, [:ulong, :ulong, :pointer, :size_t], :pointer
    attach_function :HeapSize, [:ulong, :ulong, :pointer], :size_t
    attach_function :HeapUnlock, [:ulong], :bool
    attach_function :HeapValidate, [:ulong, :ulong, :pointer], :bool
    attach_function :HeapWalk, [:ulong, :pointer], :bool

    attach_function :LocalAlloc, [:uint, :size_t], :ulong
    attach_function :LocalFlags, [:ulong], :uint
    attach_function :LocalFree, [:ulong], :ulong
    attach_function :LocalHandle, [:pointer], :ulong
    attach_function :LocalLock, [:ulong], :pointer
    attach_function :LocalReAlloc, [:ulong, :size_t, :uint], :ulong
    attach_function :LocalSize, [:ulong], :uint
    attach_function :LocalUnlock, [:ulong], :bool

    attach_function :VirtualAlloc, [:ulong, :size_t, :ulong, :ulong], :ulong
    attach_function :VirtualAllocEx, [:ulong, :pointer, :size_t, :ulong, :ulong], :ulong
    attach_function :VirtualFree, [:pointer, :size_t, :ulong], :bool
    attach_function :VirtualFreeEx, [:ulong, :pointer, :size_t, :ulong], :bool
    attach_function :VirtualLock, [:pointer, :size_t], :bool
    attach_function :VirtualProtect, [:pointer, :size_t, :ulong, :pointer], :bool
    attach_function :VirtualProtectEx, [:ulong, :pointer, :size_t, :ulong, :pointer], :bool
    attach_function :VirtualQuery, [:pointer, :pointer, :size_t], :size_t
    attach_function :VirtualQueryEx, [:ulong, :pointer, :pointer, :size_t], :size_t
    attach_function :VirtualUnlock, [:pointer, :size_t], :bool
    attach_function :RtlZeroMemory, [:pointer, :size_t], :void

    # The LocalDiscard macro from winbase.h
    def LocalDiscard(mem_loc)
      LocalReAlloc(mem_loc, 0, LMEM_MOVEABLE)
    end

    begin
      attach_function :HeapQueryInformation, [:ulong, :int, :pointer, :size_t, :pointer], :bool
      attach_function :HeapSetInformation, [:ulong, :int, :pointer, :size_t], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
