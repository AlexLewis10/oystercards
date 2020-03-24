
class Oystercard
  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = STARTING_BALANCE
    @in_use = false
  end

  attr_reader :balance

  def topup(amount)
    fail "Maximum balance £#{MAXIMUM_BALANCE}" if exceed_max?(amount)

    @balance += amount
  end

  def deduct(fare)
#    fail "Insufficient balance, your balance is £#{@balance}" if insufficient_funds?(fare)
    @balance -= fare
  end

  def exceed_max?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def touch_in
    fail "Below minimum balance of £#{MINIMUM_BALANCE}" if @balance < 1

    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end
end
