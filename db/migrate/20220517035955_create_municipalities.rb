class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.references :state, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :latitude, precision: 10, scale: 6, default: 0
      t.decimal :longitude, precision: 10, scale: 6, default: 0

      t.timestamps
    end
  end
end
