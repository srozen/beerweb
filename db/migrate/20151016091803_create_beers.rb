class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.float :degree
      t.text :description
      t.text :story

      t.timestamps null: false
    end
  end
end
