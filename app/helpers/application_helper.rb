module ApplicationHelper

  def left_days(date)
    today = Date.today

    days = date - today
    days = days.to_i
    
    if days == 0
      'HOY'
    elsif days == 1
      "Falta #{days} día"
    elsif days == -1
      "Fue hace #{ (days * -1) } día"
    elsif days > 1
      "Faltan #{days} dias"
    elsif days < 1
      "Fue hace #{ (days * -1) } dias"
    end
  end
end
