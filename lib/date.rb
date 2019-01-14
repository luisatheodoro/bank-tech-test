class Date
  def formatted_current_date
    (Time.now + 1800).strftime('%d/%m/%Y')
  end
end