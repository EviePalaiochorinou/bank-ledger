# Bank tech test

User can make bank account transactions, e.g. deposit and withdraw money, and view their bank statement using IRB.

## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/EviePalaiochorinou/bank-ledger
   ```
2. Install gems
   ```sh
   bundle install
   ```

### Usage

- Start IRB requiring the relevant files
  ```sh
  irb -r ./lib/bank_statement.rb
  ```
- Create a new account
  ```sh
  account = Account.new
  ``` 
- Deposit money

  ```sh
  account.deposit(1000)
  => 1000.00
  ```

- Withdraw money

  ```sh
  account.withdraw(500)
   => 500.00
  ```

- View bank statement
- Create a new bank statement
  ```sh
  bank_statement = BankStatement.new
  account.print_bank_statement
  date || credit || debit || balance
  01/02/2022 || 1000.00 || || 1000.00
  01/02/2022 || || 500.00 || 500.00
  ```

### Testing

Tests are written using rspec, and can be found in the spec folder.

- Run all rspec tests
  ```sh
  rspec
  ```
- Run individual tests
  ```sh
  rspec spec/name_of_test_file.rb
  ```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Approach

- The Account class handles deposits and withdrawals and stores these in a transactions record that remembers a type of transaction, the date, and the amount. It also calls on the bank statement formatter method of the BankStatement class in order to print out the statement.\n
- The BankStatement class is only responsible for getting information from the transactions record, calculating the balance after every transaction in order to format out a bank statement according the the acceptance criteria formatting.
