require 'ffi'

module Windows
  module Window
    module Dialog
      extend FFI::Library
      ffi_lib 'user32'

      private

      MB_OK                        = 0x00000000
      MB_OKCANCEL                  = 0x00000001
      MB_ABORTRETRYIGNORE          = 0x00000002
      MB_YESNOCANCEL               = 0x00000003
      MB_YESNO                     = 0x00000004
      MB_RETRYCANCEL               = 0x00000005
      MB_CANCELTRYCONTINUE         = 0x00000006
      MB_ICONHAND                  = 0x00000010
      MB_ICONQUESTION              = 0x00000020
      MB_ICONEXCLAMATION           = 0x00000030
      MB_ICONASTERISK              = 0x00000040
      MB_USERICON                  = 0x00000080
      MB_ICONWARNING               = MB_ICONEXCLAMATION
      MB_ICONERROR                 = MB_ICONHAND
      MB_ICONINFORMATION           = MB_ICONASTERISK
      MB_ICONSTOP                  = MB_ICONHAND
      MB_DEFBUTTON1                = 0x00000000
      MB_DEFBUTTON2                = 0x00000100
      MB_DEFBUTTON3                = 0x00000200
      MB_DEFBUTTON4                = 0x00000300
      MB_APPLMODAL                 = 0x00000000
      MB_SYSTEMMODAL               = 0x00001000
      MB_TASKMODAL                 = 0x00002000
      MB_HELP                      = 0x00004000
      MB_NOFOCUS                   = 0x00008000
      MB_SETFOREGROUND             = 0x00010000
      MB_DEFAULT_DESKTOP_ONLY      = 0x00020000
      MB_TOPMOST                   = 0x00040000
      MB_RIGHT                     = 0x00080000
      MB_RTLREADING                = 0x00100000
      MB_SERVICE_NOTIFICATION      = 0x00200000 # Assume Win2k or later
      MB_SERVICE_NOTIFICATION_NT3X = 0x00040000
      MB_TYPEMASK                  = 0x0000000F
      MB_ICONMASK                  = 0x000000F0
      MB_DEFMASK                   = 0x00000F00
      MB_MODEMASK                  = 0x00003000
      MB_MISCMASK                  = 0x0000C000

      attach_function :CreateDialogIndirectParamA, [:ulong, :pointer, :pointer, :pointer, :ulong], :ulong # callback
      attach_function :CreateDialogIndirectParamW, [:ulong, :pointer, :pointer, :pointer, :ulong], :ulong # callback
      attach_function :CreateDialogParamA, [:ulong, :pointer, :ulong, :pointer, :ulong], :ulong
      attach_function :CreateDialogParamW, [:ulong, :pointer, :ulong, :pointer, :ulong], :ulong
      attach_function :DialogBoxIndirectParamA, [:ulong, :pointer, :ulong, :pointer, :ulong], :pointer
      attach_function :DialogBoxIndirectParamW, [:ulong, :pointer, :ulong, :pointer, :ulong], :pointer
      attach_function :DialogBoxParamA, [:ulong, :string, :ulong, :pointer, :ulong], :pointer
      attach_function :DialogBoxParamW, [:ulong, :string, :ulong, :pointer, :ulong], :pointer
      attach_function :EndDialog, [:ulong, :pointer], :bool
      attach_function :GetDialogBaseUnits, [], :long
      attach_function :GetDlgCtrlID, [:ulong], :int
      attach_function :GetDlgItem, [:ulong, :int], :ulong
      attach_function :GetDlgItemInt, [:ulong, :int, :pointer, :bool], :uint
      attach_function :GetDlgItemTextA, [:ulong, :int, :pointer, :int], :uint
      attach_function :GetDlgItemTextW, [:ulong, :int, :pointer, :int], :uint
      attach_function :GetNextDlgGroupItem, [:ulong, :ulong, :bool], :ulong
      attach_function :GetNextDlgTabItem, [:ulong, :ulong, :bool], :ulong
      attach_function :IsDialogMessage, [:ulong, :pointer], :bool
      attach_function :MapDialogRect, [:ulong, :pointer], :bool
      attach_function :MessageBoxA, [:ulong, :string, :string, :uint], :int
      attach_function :MessageBoxW, [:ulong, :string, :string, :uint], :int
      attach_function :MessageBoxExA, [:ulong, :string, :string, :uint, :ushort], :int
      attach_function :MessageBoxExW, [:ulong, :string, :string, :uint, :ushort], :int
      attach_function :MessageBoxIndirectA, [:pointer], :int
      attach_function :MessageBoxIndirectW, [:pointer], :int
      attach_function :SendDlgItemMessageA, [:ulong, :int, :uint, :ulong, :ulong], :ulong
      attach_function :SendDlgItemMessageW, [:ulong, :int, :uint, :ulong, :ulong], :ulong
      attach_function :SetDlgItemInt, [:ulong, :int, :uint, :bool], :bool
      attach_function :SetDlgItemTextA, [:ulong, :int, :string], :bool
      attach_function :SetDlgItemTextW, [:ulong, :int, :string], :bool

      # Macros from WinUser.h

      def CreateDialog(hInstance, lpName, hParent, lpDialogFunc)
        CreateDialogParam(hInstance, lpName, hParent, lpDialogFunc, 0)
      end

      def CreateDialogIndirect(hInst, lpTemp, hPar, lpDialFunc)
        CreateDialogIndirectParam(hInst, lpTemp, hPar, lpDialFunc, 0)
      end

      def DialogBox(hInstance, lpTemp, hParent, lpDialogFunc)
        DialogBoxParam(hInstance, lpTemp, hParent, lpDialogFunc, 0)
      end

      def DialogBoxIndirect(hInst, lpTemp, hParent, lpDialogFunc)
        DialogBoxParamIndirect(hInst, lpTemp, hParent, lpDialogFunc, 0)
      end
    end
  end
end
