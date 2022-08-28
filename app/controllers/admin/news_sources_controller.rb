class Admin::NewsSourcesController < ApplicationController
  before_action :set_news_source, only: %i(show edit update)

  def index
    @news_sources = NewsSource.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @news_source = NewsSource.new
  end

  def create
    @news_source = NewsSource.new(news_source_params)
    if @news_source.save
      redirect_to admin_news_sources_url, status: :ok
    else
      render :new
    end
  end

  def edit
  end

  def update
  end


  private

  def set_news_source
    @news_source = NewsSource.find(params[:id])
  end

  def news_source_params
    params.require(:news_source).permit(:name, :url, :logo)
  end
end
