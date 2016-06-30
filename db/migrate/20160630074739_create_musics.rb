class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :musicname
      t.text :url
      t.string :genre

      #t.timestamps null: false
    end
  end
end
