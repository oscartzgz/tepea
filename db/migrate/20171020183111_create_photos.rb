class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :photo_data
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
