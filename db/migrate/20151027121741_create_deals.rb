class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
		 t.string :name
		 t.string :nameBeer
		 t.text :description
		 t.string :categorie
		 t.datetime :datedebut
		 t.datetime :datefin
		 t.float :prix
		 t.int :reference
		 t.float :reduction

      t.timestamps null: false
    end
  end
end
