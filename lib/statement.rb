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
    @transactions.reverse.each do |t|
      print "#{t.date} || #{format(t.credit)} || #{format(t.debit)} || #{format(t.current_balance)}\n"
    end
  end

  def format(amount)
    '%.2f' % amount
  end
end
