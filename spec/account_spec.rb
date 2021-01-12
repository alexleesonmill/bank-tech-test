# frozen_string_literal: true

describe Account do
  let(:account) { described_class.new(statement_class, transaction_class) }
  let(:statement_class) { double(:statement_class, new: statement) }
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }
  let(:statement) { double(:statement) }

  context 'when depositing money' do
    it 'gives an updated balance after deposit' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end

    it 'adds the deposit to transaction array' do
      account.deposit(50)
      expect(account.transactions).to include transaction
    end
  end

  context 'when withdrawing money' do
    it 'gives an updated balance after withdrawal' do
      account.deposit(50)
      account.withdraw(20)
      expect(account.balance).to eq 30
    end

    it 'stops a withdraw if balance lower than 0' do
      expect { account.withdraw(-50) }.to raise_error 'Cannot withdraw a negative amount'
    end

    it 'adds the withdrawal to transaction array' do
      account.deposit(50)
      account.withdraw(20)
      expect(account.transactions).to include transaction
    end

    it 'raises an error when withdrawal would result in negative balance' do
      expect { account.withdraw(50) }.to raise_error 'Insufficient balance available'
    end
  end

  context 'when printing statement' do
    it 'sends the transaction array to the statement class' do
      account.deposit(50)
      allow(statement_class).to receive(:print_statement).and_return(transaction)
      expect(account.print_statement).to be
    end
  end
end
