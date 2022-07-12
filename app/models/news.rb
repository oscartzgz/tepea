class News < ApplicationRecord
  belongs_to :municipality
  has_one_attached :image

  enum status: { unpublished: 0, published: 1 }

  validates_presence_of :title
end
