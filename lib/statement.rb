# frozen_string_literal: true

class Statement
  def print_statement(transactions)
    @transactions = transactions
    print_header
    print_transactions
  end

  private

  def print_header
    print "date || credit || debit || balance\n"
  end

  def print_transactions
    @transactions.reverse.each do |transaction|
      print "#{transaction.date} || #{format(transaction.credit)} || #{format(transaction.debit)} || #{transaction.current_balance}\n"
    end
  end

  def format(amount)
    '%.2f' % amount
  end
end
