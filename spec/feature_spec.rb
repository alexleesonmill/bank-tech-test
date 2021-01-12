describe 'Bank Account Feature Tests' do
  let(:account) { Account.new}
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  # As a customer,
  # So that I can save money,
  # I want to be able to deposit money into my account
  it 'shows that I have deposited money' do
    account.deposit(50)
    print = "date || credit || debit || balance\n"\
             "#{date} || 50.00 || 0.00 || 50.00\n"
    expect { account.print_statement }.to output(print).to_stdout
  end
  # As a customer,
  # So that I can spend the money I saved,
  # I want to be able to withdraw money from my account
  it 'shows that I have need money in my account to withdraw' do
    expect { account.withdraw(20) }.to raise_error('Insufficient balance available')
  end
  # As a customer,
  # So that I can see what I've spent
  # I want to be able to print a statement of my account
  it 'shows a transaction history' do
    account.deposit(50)
    account.withdraw(20)
    print = "date || credit || debit || balance\n"\
            "#{date} || 0.00 || 20.00 || 30.00\n"\
            "#{date} || 50.00 || 0.00 || 50.00\n"
    expect { account.print_statement }.to output(print).to_stdout
  end
end