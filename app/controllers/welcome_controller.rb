class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:user]

  def index
    @maps_api_key = ENV['GOOGLE_MAPS_API_KEY']
  end

  def user
  end
end
