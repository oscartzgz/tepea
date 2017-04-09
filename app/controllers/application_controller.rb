class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_logued_in
    unless current_user
        flash[:before_login] = 'Para realizar esta acción, inicia sesion con facebook'
        redirect_to :back
    end
  end
end
