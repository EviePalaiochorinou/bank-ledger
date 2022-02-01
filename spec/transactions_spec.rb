require 'transactions'

describe Transactions do
  #mock a transaction because of the timestamp?
  before do
    @transaction = Transactions.new
    @transaction.deposit(1000)
  end

  context 'tests your account actions'
    it 'can deposit money' do
      expect(@transaction.transactions).to eq([{:timestamp=>"01/02/2022", :type=>"deposit", :amount=>1000}])
    end

    it 'can withdraw money' do
      @transaction.withdraw(500)
      expect(@transaction.transactions).to include({:timestamp=>"01/02/2022", :type=>"withdraw", :amount=>500})
    end
end