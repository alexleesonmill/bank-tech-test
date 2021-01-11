# frozen_string_literal: true

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
    deposit = create_deposit(amount)
    push_transaction(deposit)
  end

  def withdraw(amount)
    raise 'Cannot withdraw a negative amount' unless amount.positive?

    @balance -= amount
    withdraw = create_withdrawal(amount)
    push_transaction(withdraw)
  end

  private

  def create_deposit(amount)
    @transaction.new(amount, 0, @balance)
  end

  def create_withdrawal(amount)
    @transaction.new(0, amount, @balance)
  end

  def push_transaction(transaction)
    @transactions << transaction
  end
end
