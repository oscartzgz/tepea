class Photo < ApplicationRecord
  include PhotoUploader[:photo]
  include Likeable
  belongs_to :user

  validates :photo, presence: true
end
