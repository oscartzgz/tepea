class NewsController < ApplicationController
  def index
    @news = municipality.news.published.order(created_at: :desc)
  end
end
