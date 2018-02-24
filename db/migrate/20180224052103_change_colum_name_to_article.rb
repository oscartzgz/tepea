class ChangeColumNameToArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :image, :image_data
  end
end
