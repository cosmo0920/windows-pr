#####################################################################
# test_sound.rb
#
# Test case for the Windows::Sound module.
#####################################################################
require 'windows/sound'
require 'test/unit'

class TC_Windows_Sound < Test::Unit::TestCase
  include Windows::Sound

  def test_sound_constants
    assert_equal(0, SND_SYNC)
    assert_equal(1, SND_ASYNC)
    assert_equal(2, SND_NODEFAULT)
    assert_equal(4, SND_MEMORY)
    assert_equal(8, SND_LOOP)
    assert_equal(16, SND_NOSTOP)
  end
   
  def test_sound_functions_defined
    assert_respond_to(self, :Beep)
    assert_respond_to(self, :PlaySound)
    assert_respond_to(self, :waveOutSetVolume)
    assert_respond_to(self, :waveOutGetVolume)
  end
end
