class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def users
    @users = User.order(created_at: 'desc')
  end

  def application_settings
    @application_settings = ApplicationSetting.all
  end
end
