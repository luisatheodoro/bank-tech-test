##About the App
This app will let you create a bank account.
After you create your account you can deposit, withdraw and print statement of your transactions.

## Running tests
In the terminal write `rspec`

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
date = Date.new
date = date.formatted_current_date
luisa_account.deposit_money(50)

to withdraw money:
luisa_account.withdraw_money(10)

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
2.5.0 :002 > luisa_account = BankAccount.new('Luisa')
 => #<BankAccount:0x00007fdeac14e410 @client_name="Luisa", @balance=0, @account_transactions=[]> 
2.5.0 :003 > require './lib/date'
 => true 
2.5.0 :004 > date = Date.new
 => #<Date: -4712-01-01 ((0j,0s,0n),+0s,2299161j)> 
2.5.0 :005 > date = date.formatted_current_date
 => "14/01/2019" 
2.5.0 :006 > luisa_account.deposit_money(50)
 => "You deposited £50 on 14/01/2019. Your account balance is £50" 
2.5.0 :007 > luisa_account.withdraw_money(10)
 => "You withdraw £10 on 14/01/2019. Your account balance is £40" 
2.5.0 :008 > luisa_account.balance
 => 40 
2.5.0 :009 > require './lib/statement'
 => true 
2.5.0 :010 > statement = Statement.new
 => #<Statement:0x00007fdeac16fb10> 
2.5.0 :011 > statement.print_statement(luisa_account)
Date || Credit || Debit || Balance
14/01/2019 ||  || 10 || 40
14/01/2019 || 50 ||  || 50
```


