class Award

  attr_accessor :initial_expires_in, :name, :initial_quality, :quality, :expires_in, :max_quality

  def initialize(name, initial_expires_in, initial_quality)
    @name = name || ""
    @initial_expires_in = initial_expires_in || 0
    @initial_quality = initial_quality || 0
    @expires_in = expires_in
    @max_quality = 50
  end

  def quality
    return 50 if initial_quality == max_quality || initial_quality - 1 == max_quality ||  initial_quality + 1 == max_quality
    case name
    when 'NORMAL ITEM'
      return initial_quality - 2 if initial_expires_in <= 0
      return initial_quality if initial_quality == 0
      return initial_quality - 1 if initial_quality > 0
    when 'Blue First'
      return initial_quality + 2 if initial_expires_in == 0
      return initial_quality + 2 if initial_expires_in < 0
      initial_quality + 1
    when 'Blue Distinction Plus'
      initial_quality
    when 'Blue Compare'
      return 0 if initial_expires_in <= 0
      return initial_quality + 3 if initial_expires_in <= 5 && initial_expires_in > 0
      return initial_quality + 2 if initial_expires_in <= 10 && initial_expires_in > 0
      return initial_quality + 1 if initial_expires_in > 10
      initial_quality
    when 'Blue Star'
      return initial_quality if initial_quality == 0
      return initial_quality - 4 if initial_expires_in <= 0
      return initial_quality - 2 if initial_expires_in > 0
      initial_quality
    end
  end

  def expires_in
    case name
    when 'NORMAL ITEM'
      return initial_expires_in * 2 if name == 'Blue Star'
      initial_expires_in - 1
    when 'Blue First'
      initial_expires_in - 1
    when 'Blue Distinction Plus'
      initial_expires_in
    when 'Blue Compare'
      initial_expires_in - 1
    when 'Blue Star'
      initial_expires_in - 1
    end
  end
end
