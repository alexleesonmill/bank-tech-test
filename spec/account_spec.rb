describe Account do
  let(:account) { Account.new }
  context 'Depositing money' do
    it 'gives an updated balance after deposit' do
      account.credit(50)
      expect(account.balance).to eq 50
    end
  end

  context 'Withdrawing money' do
    it 'gives an updated balance after withdrawal' do
      account.credit(50)
      account.debit(20)
      expect(account.balance).to eq 30
    end

    it 'stops a withdraw if balance would go lower than 0' do
      expect { account.debit(50) }.to raise_error 'Cannot withdraw - Not enough funds'
    end
  end
end