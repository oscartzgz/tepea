class Admin::NewsController < Admin::BaseController
  before_action :authorize_admin!

  def index
    @news = News.all.order(created_at: :desc)
  end

  def update
    @news = News.find(params[:id])
    @news.update(news_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def news_params
    params.require(:news).permit(:status)
  end
end
