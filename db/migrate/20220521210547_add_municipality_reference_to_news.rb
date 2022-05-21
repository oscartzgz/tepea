class AddMunicipalityReferenceToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :url, :string
    add_column :news, :image_url, :string
    add_reference :news, :municipality, null: false, foreign_key: true
  end
end
