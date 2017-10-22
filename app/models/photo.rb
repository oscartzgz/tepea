class Photo < ApplicationRecord
  include PhotoUploader[:photo]
  belongs_to :user

  validates :photo, presence: true
end
