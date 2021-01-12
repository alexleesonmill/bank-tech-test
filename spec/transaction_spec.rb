# frozen_string_literal: true

describe Transaction do
  it 'initialises a transaction when called' do
    transaction = described_class.new(50, 0, 50, '12/01/2021')
    expect(transaction).to be
  end
end
