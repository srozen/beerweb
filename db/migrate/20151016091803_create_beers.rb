class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.float :degree
      t.text :description
      t.text :story
      t.belongs_to :beer_category, index: true

      t.timestamps null: false
    end

    add_index :beers, :name, :unique => true
  end
end
