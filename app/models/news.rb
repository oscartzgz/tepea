class News < ApplicationRecord
  belongs_to :municipality
  has_one_attached :image

  validates_presence_of :title

  enum status: { unpublished: 0, published: 1 }
end
