# frozen_string_literal: true

require_relative './transaction'
require_relative './statement'

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
    deposit = create_deposit_transaction(amount)
    push_transaction(deposit)
  end

  def withdraw(amount)
    raise 'Cannot withdraw a negative amount' unless amount.positive?
    raise 'Insufficient balance available' unless @balance >= amount

    @balance -= amount
    withdraw = create_withdrawal_transaction(amount)
    push_transaction(withdraw)
  end

  def print_statement
    @statement.print_statement(@transactions)
  end

  private

  def create_deposit_transaction(amount)
    @transaction.new(amount, 0, @balance)
  end

  def create_withdrawal_transaction(amount)
    @transaction.new(0, amount, @balance)
  end

  def push_transaction(transaction)
    @transactions << transaction
  end
end
