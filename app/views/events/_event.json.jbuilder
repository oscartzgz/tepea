json.extract! event, :id, :title, :address, :date, :description, :user_id, :image_data, :created_at, :updated_at
json.url event_url(event, format: :json)
