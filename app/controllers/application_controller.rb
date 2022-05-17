class ApplicationController < ActionController::Base

  def municipality
    @municipality = Municipality.find_by_name("Tepeapulco")
  end
  
end
