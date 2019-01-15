require 'date'

class Statement

  def print_statement(bank_account)
    puts 'Date || Credit || Debit || Balance'
    bank_account.account_transactions.reverse_each do |transaction|
      puts "#{Date.new.format_date(transaction.date)} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
