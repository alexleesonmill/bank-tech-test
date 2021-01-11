require 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(statement = Statement.new, transaction = Transaction)
    @balance = 0
    @transactions = []
    @statement = statement
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    transaction = @transaction.new(amount, 0, @balance)
    @transactions << transaction
  end

  def withdraw(amount)
    raise 'Cannot withdraw a negative amount' unless amount.positive?

    @balance -= amount
    transaction = @transaction.new(0, amount, @balance)
    @transactions << transaction
  end

end