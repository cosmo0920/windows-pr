#####################################################################
# test_com_variant.rb
#
# Test case for the Windows::COM::Variant module.
#####################################################################
require 'windows/com/variant'
require 'test/unit'

class TC_Windows_COM_Variant < Test::Unit::TestCase
  include Windows::COM::Variant

  def test_variant_methods_defined
    assert_respond_to(self, :VariantChangeType)
    assert_respond_to(self, :VariantChangeTypeEx)
    assert_respond_to(self, :VariantClear)
    assert_respond_to(self, :VariantCopy)
    assert_respond_to(self, :VariantCopyInd)
    assert_respond_to(self, :VariantInit)
  end

  def test_variant_constants
    assert_equal(-1, VARIANT_TRUE)
    assert_equal(0, VARIANT_FALSE)
  end
end
