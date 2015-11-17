class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
		 t.string :name
		 t.text :description
		 t.string :start_date
		 t.string :end_date
		 t.float :reference
		

      t.timestamps null: false
    end
  end
end
