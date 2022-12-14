# frozen_string_literal: true

# News model class
class News < ApplicationRecord
  PER_PAGE = 5

  belongs_to :municipality
  belongs_to :news_source, optional: true

  has_one_attached :image

  enum status: { unpublished: 0, published: 1 }

  validates_presence_of :title
end
