class ApplicationController < ActionController::Base
  helper_method :municipality
  helper_method :authorize_admin!

  def municipality
    Municipality.find_by_host(request.host) ||
      Municipality.find_by_name("Tepeapulco")
  end

  def authorize_admin!
    return if current_user.admin?

    head :unauthorized
  end
  
end
