require 'test/unit'
require 'constants'

class ConstantsTest < Test::Unit::TestCase
  def test_01a_sharps_constants_is_array
    assert_equal true , SHARPS.kind_of?(Array)
  end

  def test_01b_flats_constants_is_array
    assert_equal true , FLATS.kind_of?(Array)
  end

  def test_02a_first_shot_at_a_chord
  	cmaj = "#{SHARPS[0]}, #{SHARPS[4]}, #{SHARPS[7]}"
  	assert_equal "C, E, G" , cmaj
  end

   def test_02b_second_shot_at_a_chord
  	dmin = "#{SHARPS[2]}, #{SHARPS[5]}, #{SHARPS[9]}"
  	assert_equal "D, F, A" , dmin
  end
end
