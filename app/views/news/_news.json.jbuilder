json.extract! news, :id, :title, :description, :image, :url, :published_at, :editor, :created_at, :updated_at
json.url news_url(news, format: :json)
