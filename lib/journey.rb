class Journey
  attr_reader :start_point

  def initialize(start_point)
    @start_point = start_point
    @end_point = nil
  end

  def origin
    @start_point
  end

  def journey_finish(end_point)
    @end_point = end_point
  end

  def calculate
    if @end_point == nil || @start_point == nil
      6
    else
      Oystercard::MINIMUM_FARE
    end
  end

  def complete
    if @end_point == nil
      false
    else
      true
    end
  end

end
