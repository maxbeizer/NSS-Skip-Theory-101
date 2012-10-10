require 'scales_minor'

class ScalesMinorSharps < ScalesMajor
  def start_index
  	SHARPS.index(start_position)
  end

  def build_minor_scale
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
end