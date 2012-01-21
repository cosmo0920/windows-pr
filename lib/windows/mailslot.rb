require 'ffi'

# The Windows module serves as a namespace only.
module Windows
  # The Mailslot module contains functions and constants related to the
  # Windows mailslot IPC mechanism.
  module Mailslot
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    # Constants

    MAILSLOT_WAIT_FOREVER = 0xFFFFFFFF
    MAILSLOT_NO_MESSAGE   = 0xFFFFFFFF

    attach_function :CreateMailslotA, [:string, :ulong, :ulong, :pointer], :long
    attach_function :CreateMailslotW, [:string, :ulong, :ulong, :pointer], :long
    attach_function :GetMailslotInfo, [:long, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :SetMailslotInfo, [:long, :ulong], :bool
  end
end
