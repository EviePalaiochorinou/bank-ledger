require 'bank_statement'
require 'transactions'

describe BankStatement do

  before do
    @bank_statement = BankStatement.new
    @transactions = Transactions.new
    @transactions.deposit(1000)
    @transactions.withdraw(500)
  end
  
  context 'can take transactions info to make a bank statement'
    it 'prints a bank statement' do
      expect{@bank_statement.print(@transactions)}.to output("date || credit || debit || balance\n01/02/2022 || 1000 || || 1000\n01/02/2022 || || 500 || 500\n").to_stdout
    end
end