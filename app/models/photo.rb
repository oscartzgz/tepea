class Photo < ApplicationRecord
  include PhotoUploader[:photo]
  belongs_to :user
end