require_relative './station'
class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1


  attr_reader :balance, :in_use, :journey_log

  attr_reader :balance
  attr_reader :in_use


  def initialize(balance = 0, max_balance = MAX_BALANCE)
    @in_use = false
    @balance = balance
    @max_balance = max_balance
    @journey_log = []

  end

  def topup(topup_amount)
    new_balance = @balance + topup_amount
    fail 'Maximum Balance Reached' if new_balance > @max_balance
    @balance = new_balance
  end


  def charge(fare = MINIMUM_FARE)
    new_balance = @balance - fare
    @balance = new_balance
  end

  def touch_in(station = Station.new)
    @journey_start = station
  end

  def touch_in

    fail 'Insufficient Funds' if @balance < 1
    @journey_log << station
    @in_use = true
  end


  def touch_out(station = Station.new)
    @journey_end = station
    @journey_log << station
    charge

  def touch_out
    charge(MINIMUM_FARE)

    @in_use = false
  end

  private

  def charge(fare)
    new_balance = @balance - fare
    @balance = new_balance
  end

end
