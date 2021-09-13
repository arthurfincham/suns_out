module HomeHelper
  def day_formatter(date)
    if date == Date.today.to_s
      'Today'
    elsif date == (Date.today + 1).to_s
      'Tomorrow'
    else
      Date.parse(date).strftime("%A")
    end 
  end
end
