class AddSlugToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :slug, :string
    add_index :news, :slug, unique: true

    say_with_time 'generating news slugs' do
      News.find_each(&:save)
    end
  end
end
