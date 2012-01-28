#####################################################################
# test_path.rb
#
# Test case for the Windows::Path module.
#####################################################################
require 'windows/path'
require 'test/unit'

class TC_Windows_Path < Test::Unit::TestCase
  include Windows::Path

  def setup
    @path = "C:\\"
  end

  def test_numeric_path_constants
    assert_equal(0x0000, GCT_INVALID)
    assert_equal(0x0001, GCT_LFNCHAR)
    assert_equal(0x0002, GCT_SHORTCHAR)
    assert_equal(0x0004, GCT_WILD)
    assert_equal(0x0008, GCT_SEPARATOR)
  end

  def test_path_functions_defined
    assert_respond_to(self, :PathAddBackslashA)
    assert_respond_to(self, :PathAddExtensionA)
    assert_respond_to(self, :PathAppendA)
    assert_respond_to(self, :PathBuildRootA)
    assert_respond_to(self, :PathCanonicalizeA)
    assert_respond_to(self, :PathCombineA)
    assert_respond_to(self, :PathCommonPrefixA)
    assert_respond_to(self, :PathCompactPathA)
    assert_respond_to(self, :PathCompactPathExA)
    assert_respond_to(self, :PathCreateFromUrlA)
    assert_respond_to(self, :PathFileExistsA)
    assert_respond_to(self, :PathFindExtensionA)
    assert_respond_to(self, :PathFindFileNameA)
    assert_respond_to(self, :PathFindNextComponentA)
    assert_respond_to(self, :PathFindOnPathA)
    assert_respond_to(self, :PathFindSuffixArrayA)
    assert_respond_to(self, :PathGetArgsA)
    assert_respond_to(self, :PathGetCharTypeA)
    assert_respond_to(self, :PathGetDriveNumberA)
    assert_respond_to(self, :PathIsContentTypeA)
    assert_respond_to(self, :PathIsDirectoryA)
    assert_respond_to(self, :PathIsDirectoryEmptyA)
    assert_respond_to(self, :PathIsFileSpecA)
    #assert_respond_to(self, PathIsHTMLFileA)
    assert_respond_to(self, :PathIsLFNFileSpecA)
    assert_respond_to(self, :PathIsNetworkPathA)
    assert_respond_to(self, :PathIsPrefixA)
    assert_respond_to(self, :PathIsRelativeA)
    assert_respond_to(self, :PathIsRootA)
    assert_respond_to(self, :PathIsSameRootA)
    assert_respond_to(self, :PathIsSystemFolderA)
    assert_respond_to(self, :PathIsUNCA)
    assert_respond_to(self, :PathIsUNCServerA)
    assert_respond_to(self, :PathIsUNCServerShareA)
    assert_respond_to(self, :PathIsURLA)
    assert_respond_to(self, :PathMakePrettyA)
    assert_respond_to(self, :PathMakeSystemFolderA)
    assert_respond_to(self, :PathMatchSpecA)
    assert_respond_to(self, :PathParseIconLocationA)
    assert_respond_to(self, :PathQuoteSpacesA)
    assert_respond_to(self, :PathRelativePathToA)
    assert_respond_to(self, :PathRemoveArgsA)
    assert_respond_to(self, :PathRemoveBackslashA)
    assert_respond_to(self, :PathRemoveBlanksA)
    assert_respond_to(self, :PathRemoveExtensionA)
    assert_respond_to(self, :PathRemoveFileSpecA)
    assert_respond_to(self, :PathRenameExtensionA)
    assert_respond_to(self, :PathSearchAndQualifyA)
    assert_respond_to(self, :PathSetDlgItemPathA)
    assert_respond_to(self, :PathSkipRootA)
    assert_respond_to(self, :PathStripPathA)
    assert_respond_to(self, :PathStripToRootA)
    assert_respond_to(self, :PathUndecorateA)
    assert_respond_to(self, :PathUnExpandEnvStringsA)
    assert_respond_to(self, :PathUnmakeSystemFolderA)
    assert_respond_to(self, :PathUnquoteSpacesA)
  end

  def teardown
    @path = nil
  end
end
