class UserPanelController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if user_params[:password].blank? and user_params[:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if current_user.update(user_params)
        bypass_sign_in @user
        format.html { redirect_to user_panel_index_path, notice: 'Informacion de perfil actualizada.' }
        # format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :image, :password, :password_confirmation)
    end
end
