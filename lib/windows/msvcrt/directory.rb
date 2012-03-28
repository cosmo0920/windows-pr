require 'ffi'

module Windows
  module MSVCRT
    module Directory
      extend FFI::Library
      ffi_lib 'msvcrt'

      attach_function :chdir, :_chdir, [:string], :int
      attach_function :wchdir, :_wchdir, [:string], :int
      attach_function :chdrive, :_chdrive, [:int], :int
      attach_function :getcwd, :_getcwd, [:pointer, :int], :pointer
      attach_function :wgetcwd, :_wgetcwd, [:pointer, :int], :pointer
      attach_function :getdcwd, :_getdcwd, [:int, :pointer, :int], :pointer
      attach_function :wgetdcwd, :_wgetdcwd, [:int, :pointer, :int], :pointer
      attach_function :getdiskfree, :_getdiskfree, [:ulong, :pointer], :ulong
      attach_function :getdrive, :_getdrive, [], :int
      attach_function :getdrives, :_getdrives, [], :ulong
      attach_function :mkdir, :_mkdir, [:string], :int
      attach_function :wmkdir, :_wmkdir, [:string], :int
      attach_function :rmdir, :_rmdir, [:string], :int
      attach_function :wrmdir, :_wrmdir, [:string], :int
      attach_function :searchenv, :_searchenv, [:string, :string, :pointer], :void
      attach_function :wsearchenv, :_wsearchenv, [:string, :string, :pointer], :void
      attach_function :searchenv_s, :_searchenv_s, [:string, :string, :pointer, :size_t], :int
      attach_function :wsearchenv_s, :_wsearchenv_s, [:string, :string, :pointer, :size_t], :int
    end
  end
end
