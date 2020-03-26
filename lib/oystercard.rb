require_relative 'journey'

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
    @current_journey = Journey.new(origin)
  end

  def touch_out(final_station)
    deduct
 #   if @current_journey = nil
 #     @current_journey = Journey.new(nil)
 #   end
    journey_maker(final_station)
  end

  def journey_maker(final_station)
    journey_stations = Hash.new
    journey_stations[:start] = @current_journey.origin
    journey_stations[:finish] = @current_journey.journey_finish(final_station)
    @history.push(journey_stations)
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
