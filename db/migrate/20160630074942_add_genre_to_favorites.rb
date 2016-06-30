class AddGenreToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :genre, :string
    add_column :favorites, :url, :text
  end
end
