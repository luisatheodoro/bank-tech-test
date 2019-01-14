class Statement

  def print_statement(bank_account)
    puts 'Date || Credit || Debit || Amount || Balance'
    bank_account.account_transactions.reverse.each do |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]}    || #{transaction[3]}"
    end
  end
end

