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

  def location
    @output["location"]["name"]
  end

  def description(day)
    day["day"]["condition"]["text"]
  end

  def temp_hi(day)
    day["day"]["maxtemp_c"]
  end

  def temp_lo(day)
    day["day"]["mintemp_c"]
  end

end
