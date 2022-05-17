module ApplicationHelper
  def municipality
    Municipality.find_by_name("Tepeapulco")
  end
end
