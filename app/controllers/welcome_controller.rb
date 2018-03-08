class WelcomeController < ApplicationController
  def index
    @maps_api_key = ENV['GOOGLE_MAPS_API_KEY']
  end

  def success_confirmation
  end
end
