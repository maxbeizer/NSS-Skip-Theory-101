require 'test/unit'
require 'scales_major'

class ScalesMajorTest < Test::Unit::TestCase
  def example_scale1
   	ScalesMajor.new("cmaj")
  end 

  def example_scale2
  	ScalesMajor.new("dmaj")
  end

  def example_scale3
  	ScalesMajor.new("dbmaj")
  end

  def test_01a_inherits_from_scales
    assert_equal "cmaj" , example_scale1.scale_name
  end

  def test_01b_inherits_start_posotion
    assert_equal "C" , example_scale1.start_position
  end

  def test_01c_inherits_start_posotion
    assert_equal "Db" , example_scale3.start_position
  end

  def test_02a_build_major_scale_from_start_position
    assert_equal "Db" , example_scale3.build_major_scale[0]
  end

  def test_02b_build_major_scale_position_1
    assert_equal ["Db", "Eb"] , example_scale3.build_major_scale
  end

  def test_02c_start_position_index
    assert_equal 0 , example_scale1.start_index
  end
end