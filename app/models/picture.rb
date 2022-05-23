class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :municipality
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :small, resize_to_limit: [200, 200]
    attachable.variant :normal, resize_to_limit: [500, 500]
    attachable.variant :large, resize_to_limit: [1000, 1000]
  end

  validates_presence_of :image
end
