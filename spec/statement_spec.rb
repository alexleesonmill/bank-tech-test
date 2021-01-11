# frozen_string_literal: true

describe Statement do
  let(:statement) { Statement.new }

  context 'Displaying Statement' do
    it 'displays a printed statement fully' do
      expect do
        statement.print_statement
      end.to output('date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n').to_stdout
    end
  end
end
