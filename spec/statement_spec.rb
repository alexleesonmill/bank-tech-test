describe Statement do
  let(:statement) { Statement.new }
  context 'Displaying Statement' do
    it 'displays a proper header' do
      expect{ statement.print_header }.to output('date || credit || debit || balance\n').to_stdout
    end

    it 'displays the first line of the statement correctly' do
      expect{ statement.print_transactions }.to output('14/01/2012 || || 500.00 || 2500.00').to_stdout
    end
  end
end