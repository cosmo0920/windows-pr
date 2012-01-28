require 'ffi'

module Windows
  module Console
    extend FFI::Library
    ffi_lib 'kernel32'

    private

    CTRL_C_EVENT        = 0
    CTRL_BREAK_EVENT    = 1
    CTRL_CLOSE_EVENT    = 2
    CTRL_LOGOFF_EVENT   = 5
    CTRL_SHUTDOWN_EVENT = 6

    ENABLE_PROCESSED_INPUT    = 0x0001
    ENABLE_LINE_INPUT         = 0x0002
    ENABLE_WRAP_AT_EOL_OUTPUT = 0x0002
    ENABLE_ECHO_INPUT         = 0x0004
    ENABLE_WINDOW_INPUT       = 0x0008
    ENABLE_MOUSE_INPUT        = 0x0010
    ENABLE_INSERT_MODE        = 0x0020
    ENABLE_QUICK_EDIT_MODE    = 0x0040

    STD_INPUT_HANDLE  = -10
    STD_OUTPUT_HANDLE = -11
    STD_ERROR_HANDLE  = -12
    
    # Console window constants
 
    FOREGROUND_BLUE            = 0x0001
    FOREGROUND_GREEN           = 0x0002
    FOREGROUND_RED             = 0x0004
    FOREGROUND_INTENSITY       = 0x0008
    BACKGROUND_BLUE            = 0x0010
    BACKGROUND_GREEN           = 0x0020
    BACKGROUND_RED             = 0x0040
    BACKGROUND_INTENSITY       = 0x0080
    COMMON_LVB_LEADING_BYTE    = 0x0100
    COMMON_LVB_TRAILING_BYTE   = 0x0200
    COMMON_LVB_GRID_HORIZONTAL = 0x0400
    COMMON_LVB_GRID_LVERTICAL  = 0x0800
    COMMON_LVB_GRID_RVERTICAL  = 0x1000
    COMMON_LVB_REVERSE_VIDEO   = 0x4000
    COMMON_LVB_UNDERSCORE      = 0x8000
    COMMON_LVB_SBCSDBCS        = 0x0300

    CONSOLE_FULLSCREEN          = 1
    CONSOLE_OVERSTRIKE          = 1
    CONSOLE_FULLSCREEN_HARDWARE = 2
      
    attach_function :AddConsoleAliasA, [:string, :string, :string], :bool
    attach_function :AddConsoleAliasW, [:string, :string, :string], :bool
    attach_function :AllocConsole, [], :bool
    attach_function :CreateConsoleScreenBuffer, [:ulong, :ulong, :pointer, :ulong, :pointer], :long
    attach_function :FillConsoleOutputAttribute, [:long, :ushort, :ulong, :ulong, :pointer], :bool
    attach_function :FillConsoleOutputCharacterA, [:long, :uint, :ulong, :ulong, :pointer], :bool
    attach_function :FillConsoleOutputCharacterW, [:long, :uint, :ulong, :ulong, :pointer], :bool
    attach_function :FlushConsoleInputBuffer, [:long], :bool
    attach_function :FreeConsole, [], :bool
    attach_function :GenerateConsoleCtrlEvent, [:ulong, :ulong], :bool
    attach_function :GetConsoleAliasA, [:string, :pointer, :ulong, :string], :ulong
    attach_function :GetConsoleAliasW, [:string, :pointer, :ulong, :string], :ulong
    attach_function :GetConsoleAliasesA, [:pointer, :ulong, :string], :ulong
    attach_function :GetConsoleAliasesW, [:pointer, :ulong, :string], :ulong
    attach_function :GetConsoleAliasesLengthA, [:string], :ulong
    attach_function :GetConsoleAliasesLengthW, [:string], :ulong
    attach_function :GetConsoleAliasExesA, [:pointer, :ulong], :ulong
    attach_function :GetConsoleAliasExesW, [:pointer, :ulong], :ulong
    attach_function :GetConsoleAliasExesLengthA, [], :ulong
    attach_function :GetConsoleAliasExesLengthW, [], :ulong
    attach_function :GetConsoleCP, [], :uint
    attach_function :GetConsoleCursorInfo, [:long, :pointer], :bool
    attach_function :GetConsoleMode, [:long, :pointer], :bool
    attach_function :GetConsoleOutputCP, [], :uint
    attach_function :GetConsoleScreenBufferInfo, [:long, :pointer], :bool
    attach_function :GetConsoleTitleA, [:pointer, :ulong], :ulong
    attach_function :GetConsoleTitleW, [:pointer, :ulong], :ulong
    attach_function :GetConsoleWindow, [], :long
    attach_function :GetLargestConsoleWindowSize, [:long], :long
    attach_function :GetNumberOfConsoleInputEvents, [:long, :pointer], :bool
    attach_function :GetNumberOfConsoleMouseButtons, [:pointer], :bool
    attach_function :GetStdHandle, [:ulong], :long
    attach_function :PeekConsoleInputA, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :PeekConsoleInputW, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :ReadConsoleA, [:long, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :ReadConsoleW, [:long, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :ReadConsoleInputA, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :ReadConsoleInputW, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :ReadConsoleOutputA, [:long, :pointer, :long, :long, :pointer], :bool
    attach_function :ReadConsoleOutputW, [:long, :pointer, :long, :long, :pointer], :bool
    attach_function :ReadConsoleOutputAttribute, [:long, :pointer, :ulong, :long, :pointer], :bool
    attach_function :ReadConsoleOutputCharacterA, [:long, :pointer, :ulong, :long, :pointer], :bool
    attach_function :ReadConsoleOutputCharacterW, [:long, :pointer, :ulong, :long, :pointer], :bool
    attach_function :ScrollConsoleScreenBufferA, [:long, :pointer, :pointer, :long, :pointer], :bool
    attach_function :ScrollConsoleScreenBufferW, [:long, :pointer, :pointer, :long, :pointer], :bool
    attach_function :SetConsoleActiveScreenBuffer, [:long], :bool
    attach_function :SetConsoleCP, [:uint], :bool
    attach_function :SetConsoleCtrlHandler, [:pointer, :bool], :bool
    attach_function :SetConsoleCursorInfo, [:long, :pointer], :bool
    attach_function :SetConsoleCursorPosition, [:long, :long], :bool
    attach_function :SetConsoleMode, [:long, :ulong], :bool
    attach_function :SetConsoleOutputCP, [:uint], :bool
    attach_function :SetConsoleScreenBufferSize, [:long, :long], :bool
    attach_function :SetConsoleTextAttribute, [:long, :long], :bool
    attach_function :SetConsoleTitleA, [:string], :bool
    attach_function :SetConsoleTitleW, [:string], :bool
    attach_function :SetConsoleWindowInfo, [:long, :bool, :pointer], :bool
    attach_function :SetStdHandle, [:ulong, :long], :bool
    attach_function :WriteConsoleA, [:long, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :WriteConsoleW, [:long, :pointer, :ulong, :pointer, :pointer], :bool
    attach_function :WriteConsoleInputA, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :WriteConsoleInputW, [:long, :pointer, :ulong, :pointer], :bool
    attach_function :WriteConsoleOutputA, [:long, :pointer, :long, :long, :pointer], :bool
    attach_function :WriteConsoleOutputW, [:long, :pointer, :long, :long, :pointer], :bool
    attach_function :WriteConsoleOutputAttribute, [:long, :pointer, :ulong, :long, :pointer], :bool
    attach_function :WriteConsoleOutputCharacterA, [:long, :pointer, :ulong, :long, :pointer], :bool
    attach_function :WriteConsoleOutputCharacterW, [:long, :pointer, :ulong, :long, :pointer], :bool

    begin
      attach_function :AttachConsole, [:ulong], :bool
      attach_function :GetConsoleDisplayMode, [:pointer], :long
      attach_function :GetConsoleFontSize, [:long, :ulong], :long
      attach_function :GetConsoleProcessList, [:pointer, :ulong], :ulong
      attach_function :GetConsoleSelectionInfo, [:pointer], :bool
      attach_function :GetCurrentConsoleFont , [:long, :bool, :pointer], :bool
      attach_function :SetConsoleDisplayMode, [:long, :ulong, :pointer], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end
  end
end
