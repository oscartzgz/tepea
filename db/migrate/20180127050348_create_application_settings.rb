class CreateApplicationSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :application_settings do |t|
      t.string :setting
      t.string :value

      t.timestamps
    end
  end
end
