require 'ffi'

module Windows
  module Clipboard
    extend FFI::Library

    private

    CF_TEXT            = 1
    CF_BITMAP          = 2
    CF_METAFILEPICT    = 3
    CF_SYLK            = 4
    CF_DIF             = 5
    CF_TIFF            = 6
    CF_OEMTEXT         = 7
    CF_DIB             = 8
    CF_PALETTE         = 9
    CF_PENDATA         = 10
    CF_RIFF            = 11
    CF_WAVE            = 12
    CF_UNICODETEXT     = 13
    CF_ENHMETAFILE     = 14
    CF_HDROP           = 15
    CF_LOCALE          = 16
    CF_MAX             = 18 # Assume Windows 2000 or later
    CF_OWNERDISPLAY    = 0x0080
    CF_DSPTEXT         = 0x0081
    CF_DSPBITMAP       = 0x0082
    CF_DSPMETAFILEPICT = 0x0083
    CF_DSPENHMETAFILE  = 0x008E

    ffi_lib 'user32'

    attach_function :ChangeClipboardChain, [:long, :long], :bool
    attach_function :CloseClipboard, [], :bool
    attach_function :CountClipboardFormats, [], :bool
    attach_function :EmptyClipboard, [], :bool
    attach_function :EnumClipboardFormats, [:int], :uint
    attach_function :GetClipboardData, [:int], :long
    attach_function :GetClipboardFormatName, :GetClipboardFormatNameA, [:int, :pointer, :int], :int
    attach_function :GetClipboardFormatNameW, [:int, :pointer, :int], :int
    attach_function :GetClipboardOwner, [], :long
    attach_function :GetClipboardSequenceNumber, [], :long
    attach_function :GetClipboardViewer, [], :long
    attach_function :GetOpenClipboardWindow, [], :long
    attach_function :GetPriorityClipboardFormat, [:pointer, :int], :int
    attach_function :IsClipboardFormatAvailable, [:uint], :bool
    attach_function :OpenClipboard, [:long], :bool
    attach_function :RegisterClipboardFormat, :RegisterClipboardFormatA, [:string], :uint
    attach_function :RegisterClipboardFormatW, [:string], :uint
    attach_function :SetClipboardData, [:uint, :long], :long
    attach_function :SetClipboardViewer, [:long], :long

    begin
      attach_function :AddClipboardFormatListener, [:long], :bool
      attach_function :GetUpdatedClipboardFormats, [:pointer, :uint, :pointer], :bool
      attach_function :RemoveClipboardFormatListener, [:long], :bool
    rescue FFI::NotFoundError
      # Windows Vista or later
    end
  end
end
