require 'date'
require 'bank_statement'

class Account

  def initialize
    @transactions = []
  end

  def withdraw(amount)
    @transactions << {
      timestamp: (DateTime.now).strftime('%d/%m/%Y'),
      type: 'withdraw',
      amount: amount
    }
  end

  def deposit(amount)
    @transactions << {
      timestamp: (DateTime.now).strftime('%d/%m/%Y'),
      type: 'deposit',
      amount: amount
    }
  end

  def print_bank_statement
    bs = BankStatement.new
    bs.print(@transactions)
  end
end