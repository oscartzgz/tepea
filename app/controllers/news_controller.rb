class NewsController < ApplicationController
  def index
    @news = municipality.news
  end
end
