
class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize(balance = 0, max_balance = MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
  end

  def topup(topup_amount)
    new_balance = @balance + topup_amount
    fail 'Maximum Balance Reached' if new_balance > @max_balance
    @balance = new_balance
  end

  def charge(fare)
    new_balance = @balance - fare
    @balance = new_balance
  end
end
