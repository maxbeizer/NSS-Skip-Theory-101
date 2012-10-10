require 'test/unit'
require 'scales'

class TestScale < Scales
  def start_index
    SHARPS.index(start_position)
  end

  def major_scale_sharps
    major_scale = []
    major_scale << start_position
    major_scale << SHARPS[start_index+2]
    major_scale << SHARPS[start_index+4]
    major_scale << SHARPS[start_index+5]
    major_scale << SHARPS[start_index+7]
    major_scale << SHARPS[start_index+9]
    major_scale << SHARPS[start_index+11]
    major_scale
  end

  def get_notes
    major_scale_sharps.join(" ")
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
    assert_equal "C D E F G A B" , TestScale.new("cmaj").generate_scale
  end
end