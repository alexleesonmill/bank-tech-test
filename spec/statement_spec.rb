describe Statement do
  let(:statement) { Statement.new }
  context 'Displaying Statement' do
    it 'displays a proper header' do
      expect{ statement.print_header }.to output('date || credit || debit || balance\n').to_stdout
    end
  end
end