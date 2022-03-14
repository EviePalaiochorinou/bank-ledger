require 'bank_statement'
require 'account'
describe 'BANK' do
  context 'User deposits,withdraws money and gets a bank statement'
  it 'shows user a bank statement according to their transaction history' do
    @bank_statement = BankStatement.new
    @account = Account.new

    allow(DateTime).to receive(:now).and_return DateTime.new(2023, 0o1, 10)
    @account.deposit(1000)

    allow(DateTime).to receive(:now).and_return DateTime.new(2023, 0o1, 13)
    @account.deposit(2000)

    allow(DateTime).to receive(:now).and_return DateTime.new(2023, 0o1, 14)
    @account.withdraw(500)
    @account.print_bank_statement

    expect do
      @account.print_bank_statement
    end.to output(
      "date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00\n13/01/2023 || 2000.00 || || 3000.00\n14/01/2023 || || 500.00 || 2500.00\n"
    ).to_stdout
  end
end
