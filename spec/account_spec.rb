require 'account'

describe Account do

  before do
    allow(DateTime).to receive(:now).and_return DateTime.new(2022, 02, 01)
    @account = Account.new
    @account.deposit(1000)
  end

  context 'tests your account actions'
  it 'can deposit money' do
    expect(@account.get_transactions).to eq([{ timestamp: '01/02/2022', type: 'deposit', amount: 1000 }])
  end

  it 'can withdraw money' do
    @account.withdraw(500)
    expect(@account.get_transactions).to include({ timestamp: '01/02/2022', type: 'withdraw', amount: 500 })
  end
end
