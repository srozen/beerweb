class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :reference
      t.belongs_to :beer_place, index: true, :polymorphic => true
      t.integer :beer_id
      t.timestamps null: false
    end
  end
end
