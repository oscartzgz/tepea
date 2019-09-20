class Article < ApplicationRecord
  include ArticleImageUploader[:image]
  belongs_to :user

  validates :user, presence: true
end
