class User::PicturesController < ApplicationController
  def new
    @picture = current_user.pictures.build(municipality: municipality)
  end

  def create
    @picture = current_user.pictures.build(municipality: municipality)
    @picture.assign_attributes(picture_params)

    if @picture.save
      redirect_to gallery_url, status: :ok, notice: 'Fotografía guardada.'
    else
      render :new, status: :unprocessable_entity, alert: 'Ocurrio un error, inenta nuevamente.'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
