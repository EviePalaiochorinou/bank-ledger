require 'transactions'

class BankStatement

  def print(transactions)
    balance = 0
	  puts "date || credit || debit || balance"
      transactions.transactions.each do |transaction|
        if transaction[:type] == "deposit"
#         TODO float formatting of amount
          balance += transaction[:amount]
          puts "#{transaction[:timestamp]} || #{sprintf('%.2f', (transaction[:amount]))} || || #{sprintf('%.2f', balance)}"
        else
          balance -= transaction[:amount]
          puts "#{transaction[:timestamp]} || || #{sprintf('%.2f', (transaction[:amount]))} || #{sprintf('%.2f', balance)}"
        end
      end
  end
end