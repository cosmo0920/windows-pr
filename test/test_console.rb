######################################################################
# test_console.rb
#
# Test case for the Windows::Console module.
######################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/console'
require 'test/unit'

class TC_Windows_Console < Test::Unit::TestCase
  include Windows::Console

  def self.startup
    @@version = `ver`.chomp[/\d.\d/].to_f
  end

  def test_console_numeric_constants
    assert_equal(0, CTRL_C_EVENT)
    assert_equal(1, CTRL_BREAK_EVENT)
    assert_equal(5, CTRL_LOGOFF_EVENT)
    assert_equal(6, CTRL_SHUTDOWN_EVENT)
    assert_equal(0x0001, ENABLE_PROCESSED_INPUT)
    assert_equal(0x0002, ENABLE_LINE_INPUT)
    assert_equal(0x0002, ENABLE_WRAP_AT_EOL_OUTPUT)
    assert_equal(0x0004, ENABLE_ECHO_INPUT)
    assert_equal(0x0008, ENABLE_WINDOW_INPUT)
    assert_equal(0x0010, ENABLE_MOUSE_INPUT)
    assert_equal(0x0020, ENABLE_INSERT_MODE)
    assert_equal(0x0040, ENABLE_QUICK_EDIT_MODE)
    assert_equal(-10, STD_INPUT_HANDLE)
    assert_equal(-11, STD_OUTPUT_HANDLE)
    assert_equal(-12, STD_ERROR_HANDLE)
  end

  def test_console_functions_defined
    assert_respond_to(self, :AddConsoleAliasA)
    assert_respond_to(self, :AddConsoleAliasW)
    assert_respond_to(self, :AllocConsole)
    assert_respond_to(self, :CreateConsoleScreenBuffer)
    assert_respond_to(self, :FillConsoleOutputAttribute)
    assert_respond_to(self, :FillConsoleOutputCharacterA)
    assert_respond_to(self, :FillConsoleOutputCharacterW)
    assert_respond_to(self, :FlushConsoleInputBuffer)
    assert_respond_to(self, :FreeConsole)
    assert_respond_to(self, :GenerateConsoleCtrlEvent)
    assert_respond_to(self, :GetConsoleAliasA)
    assert_respond_to(self, :GetConsoleAliasW)
    assert_respond_to(self, :GetConsoleAliasesA)
    assert_respond_to(self, :GetConsoleAliasesW)
    assert_respond_to(self, :GetConsoleAliasesLengthA)
    assert_respond_to(self, :GetConsoleAliasesLengthW)
    assert_respond_to(self, :GetConsoleAliasExesA)
    assert_respond_to(self, :GetConsoleAliasExesW)
    assert_respond_to(self, :GetConsoleAliasExesLengthA)
    assert_respond_to(self, :GetConsoleAliasExesLengthW)
    assert_respond_to(self, :GetConsoleCP)
    assert_respond_to(self, :GetConsoleCursorInfo)
    assert_respond_to(self, :GetConsoleMode)
    assert_respond_to(self, :GetConsoleOutputCP)
    assert_respond_to(self, :GetConsoleScreenBufferInfo)
    assert_respond_to(self, :GetConsoleTitleA)
    assert_respond_to(self, :GetConsoleTitleW)
    assert_respond_to(self, :GetConsoleWindow)
    assert_respond_to(self, :GetLargestConsoleWindowSize)
    assert_respond_to(self, :GetNumberOfConsoleInputEvents)
    assert_respond_to(self, :GetNumberOfConsoleMouseButtons)
    assert_respond_to(self, :GetStdHandle)
    assert_respond_to(self, :PeekConsoleInputA)
    assert_respond_to(self, :PeekConsoleInputW)
    assert_respond_to(self, :ReadConsoleA)
    assert_respond_to(self, :ReadConsoleW)
    assert_respond_to(self, :ReadConsoleInputA)
    assert_respond_to(self, :ReadConsoleInputW)
    assert_respond_to(self, :ReadConsoleOutputA)
    assert_respond_to(self, :ReadConsoleOutputW)
    assert_respond_to(self, :ReadConsoleOutputAttribute)
    assert_respond_to(self, :ReadConsoleOutputCharacterA)
    assert_respond_to(self, :ReadConsoleOutputCharacterW)
    assert_respond_to(self, :ScrollConsoleScreenBufferA)
    assert_respond_to(self, :ScrollConsoleScreenBufferW)
    assert_respond_to(self, :SetConsoleActiveScreenBuffer)
    assert_respond_to(self, :SetConsoleCP)
    assert_respond_to(self, :SetConsoleCtrlHandler)
    assert_respond_to(self, :SetConsoleCursorInfo)
    assert_respond_to(self, :SetConsoleCursorPosition)
    assert_respond_to(self, :SetConsoleMode)
    assert_respond_to(self, :SetConsoleOutputCP)
    assert_respond_to(self, :SetConsoleScreenBufferSize)
    assert_respond_to(self, :SetConsoleTextAttribute)
    assert_respond_to(self, :SetConsoleTitleA)
    assert_respond_to(self, :SetConsoleTitleW)
    assert_respond_to(self, :SetConsoleWindowInfo)
    assert_respond_to(self, :SetStdHandle)
    assert_respond_to(self, :WriteConsoleA)
    assert_respond_to(self, :WriteConsoleW)
    assert_respond_to(self, :WriteConsoleInputA)
    assert_respond_to(self, :WriteConsoleInputW)
    assert_respond_to(self, :WriteConsoleOutputA)
    assert_respond_to(self, :WriteConsoleOutputW)
    assert_respond_to(self, :WriteConsoleOutputAttribute)
    assert_respond_to(self, :WriteConsoleOutputCharacterA)
    assert_respond_to(self, :WriteConsoleOutputCharacterW)
  end

  def test_method_constants_xp_or_later
    omit_if(@@version < 5.1, "console tests skipped on Windows 2000")
    assert_respond_to(self, :AttachConsole)
    assert_respond_to(self, :GetConsoleDisplayMode)
    assert_respond_to(self, :GetConsoleFontSize)
    assert_respond_to(self, :GetConsoleProcessList)
    assert_respond_to(self, :GetConsoleSelectionInfo)
    assert_respond_to(self, :GetCurrentConsoleFont)
    assert_respond_to(self, :SetConsoleDisplayMode)
  end

  def self.shutdown
    @@version = nil
  end
end
