class AddNewsSourceReferenceToNews < ActiveRecord::Migration[7.0]
  def change
    add_reference :news, :news_source, foreign_key: true
  end
end
