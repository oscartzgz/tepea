class PicturesController < ApplicationController
  def index
    @pictures = municipality.pictures
  end
end
