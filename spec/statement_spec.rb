# frozen_string_literal: true

describe Statement do
  let(:statement) { described_class.new }
  let(:transactions) { [transaction_one, transaction_two] }
  let(:transaction_one) do
    instance_double(Transaction, credit: 50, debit: 0, current_balance: 50, date: '12/01/2021')
  end
  let(:transaction_two) do
    instance_double(Transaction, credit: 0, debit: 20, current_balance: 30, date: '12/01/2021')
  end

  context 'Displaying Statement' do
    it 'displays a printed statement fully' do
      expect do
        statement.print_statement(transactions)
      end.to output("date || credit || debit || balance\n12/01/2021 || 0.00 || 20.00 || 30\n12/01/2021 || 50.00 || 0.00 || 50\n").to_stdout
    end
  end
end
