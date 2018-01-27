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

  # TAGS Helpers
  def g_analytics_tag
    "<!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src=\"https://www.googletagmanager.com/gtag/js?id=#{ApplicationSetting.where(setting: 'GOOGLE_ANALYTICS_ID').take.value}\"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', '#{ApplicationSetting.where(setting: 'GOOGLE_ANALYTICS_ID').take.value}');
    </script>".html_safe
  end

end
