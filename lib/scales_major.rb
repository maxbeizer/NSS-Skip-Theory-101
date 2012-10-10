class ScalesMajor < Scales
  MAXIMUM_NOTES = 7

  def start_index
  	SHARPS.index(start_position)
  end

  def build_major_scale
  	major_scale = []
  	major_scale << start_position
  end

end