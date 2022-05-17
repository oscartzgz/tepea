class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
