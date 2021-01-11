# frozen_string_literal: true

describe Account do
  let(:account) { Account.new(statement, transaction_class) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }
  let(:statement) { double(:statement) }

  context 'Depositing money' do
    it 'gives an updated balance after deposit' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end

    it 'adds the deposit to transaction array' do
      account.deposit(50)
      expect(account.transactions).to include transaction
    end
  end

  context 'Withdrawing money' do
    it 'gives an updated balance after withdrawal' do
      account.deposit(50)
      account.withdraw(20)
      expect(account.balance).to eq 30
    end

    it 'stops a withdraw if balance lower than 0' do
      expect { account.withdraw(-50) }.to raise_error 'Cannot withdraw a negative amount'
    end

    it 'adds the withdrawal to transaction array' do
      account.withdraw(20)
      expect(account.transactions).to include transaction
    end
  end
end
