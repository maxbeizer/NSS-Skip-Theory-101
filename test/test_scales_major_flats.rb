require 'test/unit'
require 'scales_major_flats'

class ScalesMajorFlatsTest < Test::Unit::TestCase
  def example_scale1
   	ScalesMajorFlats.new("ebmaj")
  end 

  def example_scale2
  	ScalesMajorFlats.new("dbmaj")
  end

  def example_scale3
  	ScalesMajorFlats.new("gbmaj")
  end

  def example_scale4
  	ScalesMajorFlats.new("Abmaj")
  end

  def test_01a_build_major_scale_from_start_position
    assert_equal "Db" , example_scale2.build_major_scale[0]
  end

  def test_01b_build_major_scale_flats
    assert_equal ["Eb", "F", "G", "Ab", "Bb", "C", "D"] , example_scale1.build_major_scale
  end

  def test_01c_build_major_scale_flats2
    assert_equal ["Db", "Eb", "F", "Gb", "Ab", "Bb", "C"] , example_scale2.build_major_scale
  end

  def test_01d_build_major_scale_flats3
    assert_equal ["Ab", "Bb", "C", "Db", "Eb", "F", "G"] , example_scale4.build_major_scale
  end

  def test_02_start_position_index
    assert_equal 3 , example_scale1.start_index
    assert_equal 1 , example_scale2.start_index
  end
end