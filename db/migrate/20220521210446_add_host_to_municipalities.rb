class AddHostToMunicipalities < ActiveRecord::Migration[7.0]
  def change
    add_column :municipalities, :host, :string
  end
end
