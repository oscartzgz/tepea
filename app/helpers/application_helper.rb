module ApplicationHelper
  include Pagy::Frontend
  
  def municipality
    def municipality
      Municipality.find_by_host(request.host) ||
        Municipality.find_by_name("Tepeapulco")
    end
  end
end
