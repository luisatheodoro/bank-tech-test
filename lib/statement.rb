class Statement
  def print_statement(bank_account)
    puts 'date || credit || debit || balance'
    bank_account.account_transactions.reverse_each do |transaction|
      puts "#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.credit}"\
           " || #{transaction.debit} || #{format('%.2f', transaction.balance)}"
    end
  end
end
