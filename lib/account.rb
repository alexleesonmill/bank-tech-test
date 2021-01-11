class Account
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    raise 'Cannot withdraw - Not enough funds' if @balance - amount < 0

    @balance -= amount
  end
end