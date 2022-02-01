require 'transactions'

class BankStatement

  def print(transactions)
    balance = 0
	  puts "date || credit || debit || balance"
      transactions.transactions.each do |transaction|
        if transaction[:type] == "deposit"
#         TODO float formatting of amount
          balance += transaction[:amount]
          puts "#{transaction[:timestamp]} || #{(transaction[:amount])} || || #{balance}"
        else
          balance -= transaction[:amount]
          puts "#{transaction[:timestamp]} || || #{(transaction[:amount])} || #{balance}"
        end
      end
  end
end