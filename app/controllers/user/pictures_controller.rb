class User::PicturesController < ApplicationController
  before_action :authenticate_user!

  def new
    @picture = current_user.pictures.build(municipality: municipality)
  end

  def create
    @picture = current_user.pictures.build(municipality: municipality)
    @picture.assign_attributes(picture_params)

    if @picture.save
      respond_to do |format|
        format.html { redirect_to gallery_url }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity, alert: 'Ocurrio un error, inenta nuevamente.'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
