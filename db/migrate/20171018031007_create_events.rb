class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.date :date
      t.text :description
      t.references :user, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
