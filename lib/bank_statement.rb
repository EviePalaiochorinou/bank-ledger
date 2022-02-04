require_relative 'transactions'

class BankStatement
  def print(transactions)
    balance = 0
    puts 'date || credit || debit || balance'
    transactions.transactions.each do |transaction|
      if transaction[:type] == 'deposit'
        balance += transaction[:amount]
        puts "#{transaction[:timestamp]} || #{format('%.2f', (transaction[:amount]))} || || #{format('%.2f', balance)}"
      else
        balance -= transaction[:amount]
        puts "#{transaction[:timestamp]} || || #{format('%.2f', (transaction[:amount]))} || #{format('%.2f', balance)}"
      end
    end
  end
end
