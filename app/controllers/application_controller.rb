class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_logued_in
    if current_user
      user_logued_in = true
    else
      user_logued_in = false
      respond_to do |format|
        format.html { redirect_to @news, notice: 'Hooo Ohhhhhh!' }
      end
    end
  end
end
