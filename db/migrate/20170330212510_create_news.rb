class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :url
      t.date :published_at
      t.string :editor

      t.timestamps
    end
  end
end
