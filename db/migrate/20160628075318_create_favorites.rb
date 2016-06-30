class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.string :music
      t.string :artist

      #t.timestamps null: false
    end
  end
end
