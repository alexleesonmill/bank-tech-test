# frozen_string_literal: true

describe Statement do
  let(:statement) { Statement.new }
  let(:transactions) { [transaction_1, transaction_2] }
  let(:transaction_1) { double(credit: 50, debit: 0, current_balance: 50, date: '12/01/2021') }
  let(:transaction_2) { double(credit: 0, debit: 20, current_balance: 30, date: '12/01/2021') }

  context 'Displaying Statement' do
    it 'displays a printed statement fully' do
      expect { statement.print_statement(transactions) } .to output("date || credit || debit || balance\n12/01/2021 || 0.00 || 20.00 || 30\n12/01/2021 || 50.00 || 0.00 || 50\n").to_stdout
    end

  end
end
