require 'ffi'

module Windows
  module Path
    extend FFI::Library
    ffi_lib 'shlwapi'

    private

    # These constants are for use by the PathGetCharType() function.

    GCT_INVALID   = 0x0000   # Character is not valid in a path.
    GCT_LFNCHAR   = 0x0001   # Character is valid in a long file name.
    GCT_SHORTCHAR = 0x0002   # Character is valid in a short (8.3) file name.
    GCT_WILD      = 0x0004   # Character is a wildcard character.
    GCT_SEPARATOR = 0x0008   # Character is a path separator.

    URL_UNESCAPE                 = 0x10000000
    URL_ESCAPE_UNSAFE            = 0x20000000
    URL_PLUGGABLE_PROTOCOL       = 0x40000000
    URL_WININET_COMPATIBILITY    = 0x80000000
    URL_DONT_ESCAPE_EXTRA_INFO   = 0x02000000
    URL_DONT_UNESCAPE_EXTRA_INFO = URL_DONT_ESCAPE_EXTRA_INFO
    URL_BROWSER_MODE             = URL_DONT_ESCAPE_EXTRA_INFO
    URL_ESCAPE_SPACES_ONLY       = 0x04000000
    URL_DONT_SIMPLIFY            = 0x08000000
    URL_NO_META                  = URL_DONT_SIMPLIFY
    URL_UNESCAPE_INPLACE         = 0x00100000
    URL_CONVERT_IF_DOSPATH       = 0x00200000
    URL_UNESCAPE_HIGH_ANSI_ONLY  = 0x00400000
    URL_INTERNAL_PATH            = 0x00800000
    URL_FILE_USE_PATHURL         = 0x00010000
    URL_DONT_UNESCAPE            = 0x00020000
    URL_ESCAPE_PERCENT           = 0x00001000
    URL_ESCAPE_SEGMENT_ONLY      = 0x00002000
    URL_PARTFLAG_KEEPSCHEME      = 0x00000001
    URL_APPLY_DEFAULT            = 0x00000001
    URL_APPLY_GUESSSCHEME        = 0x00000002
    URL_APPLY_GUESSFILE          = 0x00000004
    URL_APPLY_FORCEAPPLY         = 0x00000008

    # URLIS enum

    URLIS_URL       = 1
    URLIS_OPAQUE    = 2
    URLIS_NOHISTORY = 3
    URLIS_FILEURL   = 4
    URLIS_APPLIABLE = 5
    URLIS_DIRECTORY = 6
    URLIS_HASQUERY  = 7

    attach_function(:PathAddBackslashA, [:pointer], :pointer)
    attach_function(:PathAddBackslashW, [:pointer], :pointer)
    attach_function(:PathAddExtensionA, [:pointer, :string], :bool)
    attach_function(:PathAddExtensionW, [:pointer, :string], :bool)
    attach_function(:PathAppendA, [:pointer, :string], :bool)
    attach_function(:PathAppendW, [:pointer, :string], :bool)
    attach_function(:PathBuildRootA, [:pointer, :int], :pointer)
    attach_function(:PathBuildRootW, [:pointer, :int], :pointer)
    attach_function(:PathCanonicalizeA, [:pointer, :string], :bool)
    attach_function(:PathCanonicalizeW, [:pointer, :string], :bool)
    attach_function(:PathCombineA, [:pointer, :string, :string], :pointer)
    attach_function(:PathCombineW, [:pointer, :string, :string], :pointer)
    attach_function(:PathCommonPrefixA, [:string, :string, :pointer], :int)
    attach_function(:PathCommonPrefixW, [:string, :string, :pointer], :int)
    attach_function(:PathCompactPathA, [:pointer, :pointer, :uint], :bool)
    attach_function(:PathCompactPathW, [:pointer, :pointer, :uint], :bool)
    attach_function(:PathCompactPathExA, [:pointer, :string, :uint, :ulong], :bool)
    attach_function(:PathCompactPathExW, [:pointer, :string, :uint, :ulong], :bool)
    attach_function(:PathCreateFromUrlA, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:PathCreateFromUrlW, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:PathFileExistsA, [:string], :bool)
    attach_function(:PathFileExistsW, [:string], :bool)
    attach_function(:PathFindExtensionA, [:string], :pointer)
    attach_function(:PathFindExtensionW, [:string], :pointer)
    attach_function(:PathFindFileNameA, [:string], :pointer)
    attach_function(:PathFindFileNameW, [:string], :pointer)
    attach_function(:PathFindNextComponentA, [:string], :pointer)
    attach_function(:PathFindNextComponentW, [:string], :pointer)
    attach_function(:PathFindOnPathA, [:pointer, :string], :bool)
    attach_function(:PathFindOnPathW, [:pointer, :string], :bool)
    attach_function(:PathFindSuffixArrayA, [:string, :string, :int], :pointer)
    attach_function(:PathFindSuffixArrayW, [:string, :string, :int], :pointer)
    attach_function(:PathGetArgsA, [:string], :pointer)
    attach_function(:PathGetArgsW, [:string], :pointer)
    attach_function(:PathGetCharTypeA, [:pointer], :uint)
    attach_function(:PathGetCharTypeW, [:pointer], :uint)
    attach_function(:PathGetDriveNumberA, [:string], :int)
    attach_function(:PathGetDriveNumberW, [:string], :int)
    attach_function(:PathIsContentTypeA, [:string, :string], :bool)
    attach_function(:PathIsContentTypeW, [:string, :string], :bool)
    attach_function(:PathIsDirectoryA, [:string], :bool)
    attach_function(:PathIsDirectoryW, [:string], :bool)
    attach_function(:PathIsDirectoryEmptyA, [:string], :bool)
    attach_function(:PathIsDirectoryEmptyW, [:string], :bool)
    attach_function(:PathIsFileSpecA, [:string], :bool)
    attach_function(:PathIsFileSpecW, [:string], :bool)
    attach_function(:PathIsLFNFileSpecA, [:string], :bool)
    attach_function(:PathIsLFNFileSpecW, [:string], :bool)
    attach_function(:PathIsNetworkPathA, [:string], :bool)
    attach_function(:PathIsNetworkPathW, [:string], :bool)
    attach_function(:PathIsPrefixA, [:string,:string], :bool)
    attach_function(:PathIsPrefixW, [:string,:string], :bool)
    attach_function(:PathIsRelativeA, [:string], :bool)
    attach_function(:PathIsRelativeW, [:string], :bool)
    attach_function(:PathIsRootA, [:string], :bool)
    attach_function(:PathIsRootW, [:string], :bool)
    attach_function(:PathIsSameRootA, [:string,:string], :bool)
    attach_function(:PathIsSameRootW, [:string,:string], :bool)
    attach_function(:PathIsSystemFolderA, [:string, :ulong], :bool)
    attach_function(:PathIsSystemFolderW, [:string, :ulong], :bool)
    attach_function(:PathIsUNCA, [:string], :bool)
    attach_function(:PathIsUNCW, [:string], :bool)
    attach_function(:PathIsUNCServerA, [:string], :bool)
    attach_function(:PathIsUNCServerW, [:string], :bool)
    attach_function(:PathIsUNCServerShareA, [:string], :bool)
    attach_function(:PathIsUNCServerShareW, [:string], :bool)
    attach_function(:PathIsURLA, [:string], :bool)
    attach_function(:PathIsURLW, [:string], :bool)
    attach_function(:PathMakePrettyA, [:pointer], :bool)
    attach_function(:PathMakePrettyW, [:pointer], :bool)
    attach_function(:PathMakeSystemFolderA, [:string], :bool)
    attach_function(:PathMakeSystemFolderW, [:string], :bool)
    attach_function(:PathMatchSpecA, [:string,:string], :bool)
    attach_function(:PathMatchSpecW, [:string,:string], :bool)
    attach_function(:PathParseIconLocationA, [:pointer], :int)
    attach_function(:PathParseIconLocationW, [:pointer], :int)
    attach_function(:PathQuoteSpacesA, [:pointer], :void)
    attach_function(:PathQuoteSpacesW, [:pointer], :void)
    attach_function(:PathRelativePathToA, [:pointer, :string, :ulong, :string, :ulong], :bool)
    attach_function(:PathRelativePathToW, [:pointer, :string, :ulong, :string, :ulong], :bool)
    attach_function(:PathRemoveArgsA, [:pointer], :void)
    attach_function(:PathRemoveArgsW, [:pointer], :void)
    attach_function(:PathRemoveBackslashA, [:pointer], :pointer)
    attach_function(:PathRemoveBackslashW, [:pointer], :pointer)
    attach_function(:PathRemoveBlanksA, [:pointer], :void)
    attach_function(:PathRemoveBlanksW, [:pointer], :void)
    attach_function(:PathRemoveExtensionA, [:pointer], :void)
    attach_function(:PathRemoveExtensionW, [:pointer], :void)
    attach_function(:PathRemoveFileSpecA, [:pointer], :bool)
    attach_function(:PathRemoveFileSpecW, [:pointer], :bool)
    attach_function(:PathRenameExtensionA, [:pointer, :string], :bool)
    attach_function(:PathRenameExtensionW, [:pointer, :string], :bool)
    attach_function(:PathSearchAndQualifyA, [:string, :pointer, :uint], :bool)
    attach_function(:PathSearchAndQualifyW, [:string, :pointer, :uint], :bool)
    attach_function(:PathSetDlgItemPathA, [:long, :int, :string], :void)
    attach_function(:PathSetDlgItemPathW, [:long, :int, :string], :void)
    attach_function(:PathSkipRootA, [:string], :pointer)
    attach_function(:PathSkipRootW, [:string], :pointer)
    attach_function(:PathStripPathA, [:pointer], :void)
    attach_function(:PathStripPathW, [:pointer], :void)
    attach_function(:PathStripToRootA, [:pointer], :bool)
    attach_function(:PathStripToRootW, [:pointer], :bool)
    attach_function(:PathUndecorateA, [:pointer], :void)
    attach_function(:PathUndecorateW, [:pointer], :void)
    attach_function(:PathUnExpandEnvStringsA, [:string, :pointer, :uint], :bool)
    attach_function(:PathUnExpandEnvStringsW, [:string, :pointer, :uint], :bool)
    attach_function(:PathUnmakeSystemFolderA, [:string], :bool)
    attach_function(:PathUnmakeSystemFolderW, [:string], :bool)
    attach_function(:PathUnquoteSpacesA, [:pointer], :void)
    attach_function(:PathUnquoteSpacesW, [:pointer], :void)

    attach_function(:UrlApplySchemeA, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlApplySchemeW, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCanonicalizeA, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCanonicalizeW, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCombineA, [:string, :string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCombineW, [:string, :string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCompareA, [:string, :string, :bool], :int)
    attach_function(:UrlCompareW, [:string, :string, :bool], :int)
    attach_function(:UrlCreateFromPathA, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlCreateFromPathW, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlEscapeA, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlEscapeW, [:string, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlGetLocationA, [:string], :pointer)
    attach_function(:UrlGetLocationW, [:string], :pointer)
    attach_function(:UrlGetPartA, [:string, :pointer, :pointer, :ulong, :ulong], :ulong)
    attach_function(:UrlGetPartW, [:string, :pointer, :pointer, :ulong, :ulong], :ulong)
    attach_function(:UrlHashA, [:string, :pointer, :ulong], :ulong)
    attach_function(:UrlHashW, [:string, :pointer, :ulong], :ulong)
    attach_function(:UrlIsA, [:string, :ulong], :bool)
    attach_function(:UrlIsW, [:string, :ulong], :bool)
    attach_function(:UrlIsNoHistoryA, [:string], :bool)
    attach_function(:UrlIsNoHistoryW, [:string], :bool)
    attach_function(:UrlIsOpaqueA, [:string], :bool)
    attach_function(:UrlIsOpaqueW, [:string], :bool)
    attach_function(:UrlUnescapeA, [:pointer, :pointer, :pointer, :ulong], :ulong)
    attach_function(:UrlUnescapeW, [:pointer, :pointer, :pointer, :ulong], :ulong)

    # Macros

    def UrlEscapeSpaces(pszUrl, pszEscaped, pcchEscaped)
      UrlCanonicalizeA(
        pszUrl,
        pszEscaped,
        pcchEscaped,
        URL_ESCAPE_SPACES_ONLY | URL_DONT_ESCAPE_EXTRA_INFO
      )
    end

    def UrlIsFileUrl(pszUrl)
      UrlIsA(pszUrl, URLIS_FILEURL)
    end

    def UrlUnescapeInPlace(pszUrl, dwFlags)
      UrlUnescapeA(pszUrl, nil, nil, dwFlags | URL_UNESCAPE_INPLACE)
    end
  end
end
