class Municipality < ApplicationRecord
  belongs_to :state
  has_many :news
end
