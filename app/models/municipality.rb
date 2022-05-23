class Municipality < ApplicationRecord
  belongs_to :state
  has_many :news
  has_many :pictures
end
