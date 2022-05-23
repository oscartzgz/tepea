class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :municipality
  has_one_attached :image
end
