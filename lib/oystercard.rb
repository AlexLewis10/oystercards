
class Oystercard
  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = STARTING_BALANCE
    @entry_station = nil
    @history = []
  end

  attr_reader :balance, :entry_station, :history

  def topup(amount)
    fail "Maximum balance £#{MAXIMUM_BALANCE}" if exceed_max?(amount)

    @balance += amount
  end


  def exceed_max?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def touch_in(origin)
    fail "Below minimum balance of £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @entry_station = origin
  end

  def touch_out(final)
    deduct
    journey_maker(final)
    @entry_station = nil
  end

  def journey_maker(final)
    journey = Hash.new
    journey[:start] = @entry_station
    journey[:finish] = final
    @history.push(journey)
  end
  def in_journey?
    @entry_station != nil
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
