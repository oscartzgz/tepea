class News < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  private

    def should_generate_new_friendly_id?
      slug.nil? || name_changed? || location_changed?
    end
end
