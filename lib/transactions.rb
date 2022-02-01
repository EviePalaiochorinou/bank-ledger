require 'date'

class Transactions

  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def deposit(amount)
    @transactions << {
      :timestamp => (DateTime.now).strftime("%d/%m/%Y"),
      :type => "deposit",
      :amount => amount,
    }
  end

  def withdraw(amount)
    @transactions << {
      :timestamp => (DateTime.now).strftime("%d/%m/%Y"),
      :type => "withdraw",
      :amount => amount,
    }
  end
end