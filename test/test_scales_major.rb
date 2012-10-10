require 'test/unit'
require 'scales_major'

class Scales_MajorTest < Test::Unit::TestCase
  def example_scale1
   	Scales.new("cmaj")
  end 

  def example_scale2
  	Scales.new("dmaj")
  end

  def example_scale3
  	Scales.new("dbmaj")
  end

  def test_01_inherits_from_scales
    assert_equal "cmaj" , example_scale.scale_name
  end

end