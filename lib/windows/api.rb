require 'fiddle'
require 'rbconfig'

module Windows
  MSVCRT_DLL = if RbConfig::CONFIG['arch'].include?('ucrt')
                 'ucrtbase'
               else
                 'msvcrt'
               end

  # A small wrapper around Fiddle for declaring Windows API functions.
  class API
    VERSION = '1.0.0'

    class Error < RuntimeError; end
    class LoadLibraryError < Error; end

    DATA_TYPES = {
      'ATOM' => 'I', 'BOOL' => 'B', 'BOOLEAN' => 'B', 'BYTE' => 'I',
      'CALLBACK' => 'K', 'CHAR' => 'I', 'COLORREF' => 'L', 'DWORD' => 'L',
      'DWORDLONG' => 'L', 'DWORD_PTR' => 'P', 'DWORD32' => 'I',
      'DWORD64' => 'L', 'HANDLE' => 'L', 'HBITMAP' => 'L', 'HBRUSH' => 'L',
      'HCURSOR' => 'L', 'HDC' => 'L', 'HFILE' => 'I', 'HFONT' => 'L',
      'HICON' => 'L', 'HINSTANCE' => 'L', 'HKEY' => 'L', 'HLOCAL' => 'L',
      'HMENU' => 'L', 'HMODULE' => 'L', 'HRESULT' => 'L', 'HWND' => 'L',
      'INT' => 'I', 'INT_PTR' => 'P', 'INT32' => 'I', 'INT64' => 'L',
      'LANGID' => 'I', 'LCID' => 'L', 'LCTYPE' => 'L', 'LONG' => 'L',
      'LONGLONG' => 'L', 'LONG_PTR' => 'P', 'LONG32' => 'L',
      'LONG64' => 'L', 'LPARAM' => 'P', 'LPBOOL' => 'P', 'LPBYTE' => 'P',
      'LPCOLORREF' => 'P', 'LPCSTR' => 'S', 'LPCTSTR' => 'S',
      'LPCVOID' => 'P', 'LPCWSTR' => 'P', 'LPDWORD' => 'P',
      'LPHANDLE' => 'P', 'LPINT' => 'P', 'LPLONG' => 'P', 'LPSTR' => 'P',
      'LPTSTR' => 'P', 'LPVOID' => 'P', 'LPWORD' => 'P', 'LPWSTR' => 'P',
      'LRESULT' => 'P', 'PBOOL' => 'P', 'PBOOLEAN' => 'P', 'PBYTE' => 'P',
      'PHKEY' => 'P', 'SC_HANDLE' => 'L', 'SC_LOCK' => 'L',
      'SERVICE_STATUS_HANDLE' => 'L', 'SHORT' => 'I', 'SIZE_T' => 'P',
      'TCHAR' => 'L', 'UINT' => 'I', 'UINT_PTR' => 'P', 'UINT32' => 'I',
      'UINT64' => 'L', 'ULONG' => 'L', 'ULONGLONG' => 'L',
      'ULONG_PTR' => 'P', 'ULONG32' => 'L', 'ULONG64' => 'L',
      'USHORT' => 'I', 'USN' => 'L', 'WINAPI' => 'L', 'WORD' => 'I'
    }.freeze

    FIDDLE_TYPES = {
      'B' => Fiddle::TYPE_INT,
      'I' => Fiddle::TYPE_INT,
      'K' => Fiddle::TYPE_VOIDP,
      # Most declarations in this project use L for both DWORD values and
      # handles. A pointer-sized integer preserves handles on 64-bit Windows.
      'L' => Fiddle::TYPE_INTPTR_T,
      'P' => Fiddle::TYPE_VOIDP,
      # S is a read-only pointer, but unlike Fiddle's const-string type it
      # must also accept binary strings containing null bytes.
      'S' => Fiddle::TYPE_VOIDP,
      'V' => Fiddle::TYPE_VOID
    }.freeze

    @auto_constant = false
    @auto_method = false
    @auto_namespace = nil
    @auto_unicode = false
    @libraries = {}

    class NativeFunction
      attr_reader :dll_name, :effective_function_name, :function_name,
                  :prototype, :return_type

      def initialize(function, function_name, effective_function_name,
                     prototype, return_type, dll_name)
        @function = function
        @function_name = function_name
        @effective_function_name = effective_function_name
        @prototype = prototype
        @return_type = return_type
        @dll_name = dll_name
      end

      def call(*arguments)
        arguments = arguments.map { |argument| argument.nil? ? 0 : argument }
        result = @function.call(*arguments)
        return result unless @return_type == 'P'
        return nil if result.nil? || result.to_i.zero?

        result.to_s
      end
    end

    class << self
      attr_accessor :auto_constant, :auto_method, :auto_namespace, :auto_unicode

      def library(name)
        key = name.downcase.sub(/\.dll\z/i, '')
        @libraries[key] ||= begin
          Fiddle.dlopen(name)
        rescue Fiddle::DLError
          begin
            Fiddle.dlopen("#{name}.dll")
          rescue Fiddle::DLError => error
            raise LoadLibraryError, error.message
          end
        end
      end
    end

    attr_reader :dll_name, :effective_function_name, :function_name,
                :prototype, :return_type

    def initialize(function_name, prototype = 'V', return_type = 'L', dll_name = 'kernel32')
      @function_name = function_name
      @prototype = normalize_prototype(prototype)
      @return_type = normalize_type(return_type)
      @dll_name = dll_name
      @boolean = @return_type == 'B'

      @function = load_function(@function_name, ansi_fallback: true)
      ansi_function = nil
      wide_function = nil

      if self.class.auto_unicode && @dll_name !~ /(?:msvcr|ucrt)/i && @function_name !~ /[AW]\z/
        ansi_function = try_function("#{@function_name}A")
        wide_function = try_function("#{@function_name}W")
      end

      install_api(@function_name, @function, @boolean)
      install_api("#{@function_name}A", ansi_function, @boolean) if ansi_function
      install_api("#{@function_name}W", wide_function, @boolean) if wide_function
    end

    def call(*arguments)
      @function.call(*arguments)
    end

    private

    def normalize_prototype(prototype)
      values = prototype.is_a?(Array) ? prototype : prototype.chars
      values = [] if values == ['V']
      values.map { |type| normalize_type(type) }
    end

    def normalize_type(type)
      type = DATA_TYPES.fetch(type, type)
      unless FIDDLE_TYPES.key?(type)
        raise ArgumentError, "unsupported API type: #{type.inspect}"
      end
      type
    end

    def load_function(name, ansi_fallback: false)
      function = try_function(name)
      function ||= try_function("#{name}A") if ansi_fallback && name !~ /[AW]\z/
      return function if function

      raise LoadLibraryError, "function #{name} not found in #{@dll_name}"
    end

    def try_function(name)
      address = self.class.library(@dll_name)[name]
      @effective_function_name = name if name == @function_name || @function.nil?
      function = Fiddle::Function.new(
        address,
        @prototype.map { |type| FIDDLE_TYPES.fetch(type) },
        FIDDLE_TYPES.fetch(@return_type),
        Fiddle::Function::DEFAULT
      )
      NativeFunction.new(
        function, @function_name, name, @prototype.dup, @return_type, @dll_name
      )
    rescue Fiddle::DLError
      nil
    end

    def install_api(name, function, boolean)
      return unless self.class.auto_constant || self.class.auto_method

      namespace = namespace_object
      constant_name = constant_name(name)

      namespace.const_set(constant_name, function) if self.class.auto_constant
      return unless self.class.auto_method

      namespace.send(:define_method, name) do |*arguments|
        result = function.call(*arguments)
        boolean ? result != 0 : result
      end

      if name.start_with?('_')
        namespace.send(:alias_method, name.delete_prefix('_'), name)
      end
    end

    def namespace_object
      name = self.class.auto_namespace
      raise Error, 'auto_namespace must be set' unless name

      name.split('::').reject(&:empty?).inject(Object) do |namespace, part|
        namespace.const_get(part)
      end
    end

    def constant_name(name)
      value = name.delete_prefix('_')
      value[0] = value[0].upcase
      value
    end
  end
end
