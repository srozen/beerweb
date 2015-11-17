class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.float :degree
      t.text :description
      t.text :story
      t.boolean :confirmed, default: false
      t.belongs_to :beer_category, index: true
      t.timestamps null: false
    end

    add_index :beers, :name, :unique => true
  end
end
