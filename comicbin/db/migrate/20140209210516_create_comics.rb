class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title, null: false
      t.text :description
      t.text :image
    end
  end
end
