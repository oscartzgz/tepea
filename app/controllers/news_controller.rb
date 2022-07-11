class NewsController < ApplicationController
  def index
    @news = municipality.news.order(created_at: :desc)
  end
end
