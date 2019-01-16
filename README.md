##About the App
This app will let you create a bank account.
After you create your account you can deposit, withdraw and print statement of your transactions.

## My approach 
With this project I followed a strict TDD approach, writing a feature and unit test first and seeing it fail, with 
each error message I would fix it until I had a passing test.
Tried to follow responsibility principle and each class and method only knows what they need to.

## My Structure
Bank Account - Responsible for managing everything related to a bank account like balance, transactions history and name.
Transaction - Responsible to creating individual transaction to be stored in the bank account transactions.
Date - Responsible for formatting date method.
Statement - Responsible for formatting and printing the statement.

## Cloning the project to your computer
In the terminal:
 `git clone https://github.com/luisatheodoro/bank-tech-test.git`
 `cd bank-tech-test`

##Installing dependencies
`bundle install`

## Running tests
In the terminal write `rspec`

## Running linted
In the terminal write `rubocop`

## Test Coverage

COVERAGE: 100.00% -- 86/86 lines in 10 files

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
luisa_account = BankAccount.new('Luisa')

to deposit money:
require './lib/date'
luisa_account.deposit_money(50.00)

to withdraw money:
luisa_account.withdraw_money(10.00)

to check balance:
luisa_account.balance

to see printed statement:
require './lib/statement'
statement = Statement.new
statement.print_statement(luisa_account)
```
## IRB example
```
2.5.0 :001 > require './lib/bank_account'
 => true 
2.5.0 :002 > require './lib/date'
 => true 
2.5.0 :003 > require './lib/statement'
 => true 
2.5.0 :004 > account = BankAccount.new('Luisa')
 => #<BankAccount:0x00007ff10a1b2030 @client_name="Luisa", @balance=0, @account_transactions=[]> 
2.5.0 :005 >  account.deposit_money(24.00)
 => "You deposited £24.0 on 15/01/2019. Your account balance is £24.0" 
2.5.0 :006 >  account.deposit_money(25.00)
 => "You deposited £25.0 on 15/01/2019. Your account balance is £49.0" 
2.5.0 :007 >  account.deposit_money(26.00)
 => "You deposited £26.0 on 15/01/2019. Your account balance is £75.0" 
2.5.0 :008 > 
2.5.0 :009 > statement = Statement.new
 => #<Statement:0x00007ff10a1bec40> 
2.5.0 :010 > statement.print_statement(account)
Date || Credit || Debit || Balance
15/01/2019 || 26.0 ||  || 75.0
15/01/2019 || 25.0 ||  || 49.0
15/01/2019 || 24.0 ||  || 24.0

```



