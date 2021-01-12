# frozen_string_literal: true

describe Transaction do
  it 'initialises a transaction when called' do
    transaction = Transaction.new(50, 0, 50, '12/01/2021')
    expect(transaction.credit).to eq 50
    expect(transaction.debit).to eq 0
    expect(transaction.current_balance).to eq 50
    expect(transaction.date).to eq '12/01/2021'
  end
end
