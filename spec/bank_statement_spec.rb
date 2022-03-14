require 'bank_statement'
require 'account'

describe BankStatement do
  before do
    allow(DateTime).to receive(:now).and_return DateTime.new(2022, 02, 01)
    @bank_statement = BankStatement.new
    @account = Account.new
    @account.deposit(1000)
    @account.withdraw(500)
  end

  context 'can take transactions info to make a bank statement'
  it 'prints a bank statement' do
    expect{@bank_statement.print(@account.get_transactions)}.to output("date || credit || debit || balance\n01/02/2022 || 1000.00 || || 1000.00\n01/02/2022 || || 500.00 || 500.00\n").to_stdout
  end
end
