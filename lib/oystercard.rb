
class Oystercard

  MAX_BALANCE

  attr_reader :balance

  def initialize(balance = 0, max_balance = MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
  end

  def topup(number)
    new_balance = @balance + number
    fail 'Maximum Balance Reached' if new_balance > @max_balance
    @balance = new_balance
  end
end
