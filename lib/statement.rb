class Statement
  def print_statement(bank_account)
    puts 'date || credit || debit || balance'
    transactions_obj = bank_account.transactions
    transactions_obj.transactions_log.reverse_each do |transaction|
      puts "#{transaction[:date].strftime('%d/%m/%Y')} || #{transaction[:credit]}"\
           " || #{transaction[:debit]} || #{format('%.2f', transaction[:balance])}"
    end
  end
end
