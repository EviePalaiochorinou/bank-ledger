  require 'bank_statement'
  require 'transactions'
describe 'BANK' do  
context 'User deposits,withdraws money and gets a bank statement'
  it 'shows user a bank statement according to their transaction history' do
    @bank_statement = BankStatement.new
    @transactions = Transactions.new

    allow(DateTime).to receive(:now).and_return DateTime.new(2023,01,10)
    @transactions.deposit(1000)

    allow(DateTime).to receive(:now).and_return DateTime.new(2023,01,13)
    @transactions.deposit(2000)

    allow(DateTime).to receive(:now).and_return DateTime.new(2023,01,14)
    @transactions.withdraw(500)
    @bank_statement.print(@transactions)

    expect{@bank_statement.print(@transactions)}.to output("date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00\n13/01/2023 || 2000.00 || || 3000.00\n14/01/2023 || || 500.00 || 2500.00\n").to_stdout
  end
end  
