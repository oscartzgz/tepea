class NewsController < ApplicationController
  before_action :set_news, only: :show

  def index
    @news = municipality.news.published.order(created_at: :desc)
  end

  def show
    @og_facebook =
      OpenStruct.new({
        meta_title: @news.title,
        meta_image: @news.image_url,
        meta_description: @news.description
      })
  end

  private

  def set_news
    @news = News.find(params[:id])
  end
end
