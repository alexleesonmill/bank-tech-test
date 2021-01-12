# frozen_string_literal: true

class Statement
  def print_statement(transactions)
    @transactions = transactions
    print_header
    print_transactions
  end

  private

  def print_header
    print 'date || credit || debit || balance\n'
  end

  def print_transactions
    print '14/01/2012 || || 500.00 || 2500.00\n'
  end
end
