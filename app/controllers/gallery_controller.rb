class GalleryController < ApplicationController
  def index
    @pictures = municipality.pictures.order(created_at: :desc)
  end  
end
