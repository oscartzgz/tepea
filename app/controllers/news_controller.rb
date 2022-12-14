# frozen_string_literal: true

# News Controller class
class NewsController < ApplicationController
  before_action :set_news, only: :show

  def index
    @pagy, @news = pagy(municipality.news.published.order(created_at: :desc), items: News::PER_PAGE)

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def show
    @og_facebook = OpenStruct.new({ meta_title: @news.title,
                                    meta_image: @news.image_url,
                                    meta_description: @news.description })
    @meta_redirection_url = @news.url
  end

  private

  def set_news
    @news = News.find(params[:id])
  end
end
