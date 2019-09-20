class ChangeImageUrlToImageForUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :image_url, :image 
  end
end
