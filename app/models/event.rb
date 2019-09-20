class Event < ApplicationRecord
  # include ImageUploader::Attachment.new(:image) # adds an 'image' virtual attribute
  include ImageUploader[:image]

  belongs_to :user
  validates :title, :date, :address, presence: true

end
