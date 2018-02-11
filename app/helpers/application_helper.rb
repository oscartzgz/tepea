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

  def facebook_sdk_tag
    "<script>
      window.fbAsyncInit = function() {
        FB.init({
          appId            : '#{ApplicationSetting.where(setting: 'FACEBOOK_APP_ID').take.value}',
          autoLogAppEvents : true,
          xfbml            : true,
          version          : 'v2.12'
        });        
      };


      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = \"https://connect.facebook.net/es_LA/sdk.js\";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
      </script>".html_safe
  end

  # Yo can paste url to be shared and the size of button with two values
  # small or large
  def fb_share_button(link, size='small')

    "<div 
      class=\"fb-share-button\" 
      data-href=\"#{link}\" 
      data-layout=\"button_count\" 
      data-size=\"#{size}\" 
      data-mobile-iframe=\"true\">
    </div>".html_safe
  end
  
end
