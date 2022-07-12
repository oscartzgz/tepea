class Admin::MunicipalitiesController < Admin::BaseController
  before_action :set_municipality, only: %i[edit update]

  def index
    @municipalities = Municipality.all
  end

  def edit
  end

  def update
    @municipality.update(municipality_params)
    respond_to do |format|
      format.html { redirect_to admin_municipalities_path }
      format.turbo_stream 
    end
  end

  private

  def set_municipality
    @municipality = Municipality.find(params[:id])
  end

  def municipality_params
    params.require(:municipality).permit(:logo)
  end
end