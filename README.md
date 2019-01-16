##About the App
This app will let you create a bank account.
After you create your account you can deposit, withdraw and print statement of your transactions.

## My approach 
With this project I followed a strict TDD approach, writing a feature and unit test first and seeing it fail, with 
each error message I would fix it until I had a passing test.
Tried to follow responsibility principle and each class and method only knows what they need to.

## My Structure
Bank Account - Responsible for managing everything related to a bank account, I believe balance and the transaction logs should be together inside the bank account.
Transactions - Responsible to saving to transactions logs
Statement - Responsible for formatting and printing the statement.

## Cloning the project to your computer
In the terminal:
 `git clone https://github.com/luisatheodoro/bank-tech-test.git`
 `cd bank-tech-test`

##Installing dependencies
`bundle install`

## Running tests
In the terminal write `rspec`

## Running linting
In the terminal write `rubocop`

## Test Coverage

COVERAGE: 100.00% -- 111/111 lines in 8 files

## Acceptance criteria
```
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Using the App
In the terminal write `irb`

```
to create a bank account:
require './lib/bank_account'
account = BankAccount.new()

to deposit money:
account.deposit_money(50.00)

to withdraw money:
account.withdraw_money(10.00)

to check balance:
account.balance

to see printed statement:
require './lib/statement'
statement = Statement.new
statement.print_statement(account)
```
## IRB example
```
2.5.0 :001 > require './lib/bank_account'
 => true 
2.5.0 :002 > require './lib/statement'
 => true 
2.5.0 :003 > account = BankAccount.new()
 => #<BankAccount:0x00007fa65c0fc648 @balance=0, @account_transactions=[]> 
2.5.0 :004 >  account.deposit_money(24.00)
 => [#<Transaction:0x00007fa65c105540 @date=2019-01-16 11:03:02 +0000, @credit="24.00", @debit=nil, @balance="24.00">] 
2.5.0 :005 >  account.deposit_money(25.00)
 => [#<Transaction:0x00007fa65c105540 @date=2019-01-16 11:03:02 +0000, @credit="24.00", @debit=nil, @balance="24.00">, #<Transaction:0x00007fa65c10e5a0 @date=2019-01-16 11:03:02 +0000, @credit="25.00", @debit=nil, @balance="49.00">] 
2.5.0 :006 >  account.deposit_money(26.00)
 => [#<Transaction:0x00007fa65c105540 @date=2019-01-16 11:03:02 +0000, @credit="24.00", @debit=nil, @balance="24.00">, #<Transaction:0x00007fa65c10e5a0 @date=2019-01-16 11:03:02 +0000, @credit="25.00", @debit=nil, @balance="49.00">, #<Transaction:0x00007fa65b99f328 @date=2019-01-16 11:03:02 +0000, @credit="26.00", @debit=nil, @balance="75.00">] 
2.5.0 :007 > 
2.5.0 :008 > statement = Statement.new
 => #<Statement:0x00007fa65b9a6dd0> 
2.5.0 :009 > statement.print_statement(account)
date || credit || debit || balance
16/01/2019 || 26.00 ||  || 75.00
16/01/2019 || 25.00 ||  || 49.00
16/01/2019 || 24.00 ||  || 24.00


```



