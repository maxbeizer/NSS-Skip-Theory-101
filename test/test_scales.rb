require 'test/unit'
require 'scales'

class TestScale < Scales
  def build_major_scale_flats
    major_scale = [1, 2, 4 ,6]
  end
end
class ScalesTest < Test::Unit::TestCase
  def example_scale1
   	Scales.new("cmaj")
  end 

  def example_scale2
  	Scales.new("dmaj")
  end

  def example_scale3
  	Scales.new("dbmaj")
  end

  def test_01_scale_name_readable
    assert_equal "cmaj" , example_scale1.scale_name
  end

  def test_02_start_position
    assert_equal "C" , example_scale1.start_position
  end

  def test_03a_start_position_not_C
    assert_equal "D" , example_scale2.start_position
  end

  def test_03b_start_position_FLATS_db
    assert_equal "Db" , example_scale3.start_position
  end

  def test_03c_start_position_DNE
    assert_raise ArgumentError do 
    	Scales.new("hmaj").start_position
    end
  end

  def test_04_print_scale
    assert_equal "C, D, E, F, G, A, B" , TestScale.new("cmaj").generate_scale
  end
end