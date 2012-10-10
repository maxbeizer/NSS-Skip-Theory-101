require 'scales_minor'

class ScalesMinorSharps < ScalesMinor
  def start_index
  	SHARPS.index(start_position)
  end

  def build_minor_scale_sharps
  	major_scale = []
  	major_scale << start_position
  	major_scale << SHARPS[start_index+2]
  	major_scale << SHARPS[start_index+3]
  	major_scale << SHARPS[start_index+5]
  	major_scale << SHARPS[start_index+7]
  	major_scale << SHARPS[start_index+8]
  	major_scale << SHARPS[start_index+10]
  	major_scale
  end
end