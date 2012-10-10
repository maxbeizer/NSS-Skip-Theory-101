require 'scales_major'

class ScalesMajorFlats < ScalesMajor
  def start_index
  	FLATS.index(start_position)
  end

  def build_major_scale
  	major_scale = []
  	major_scale << start_position
  	major_scale << FLATS[start_index+2]
  	major_scale << FLATS[start_index+4]
  	major_scale << FLATS[start_index+5]
  	major_scale << FLATS[start_index+7]
  	major_scale << FLATS[start_index+9]
  	major_scale << FLATS[start_index+11]
  	major_scale
  end
end