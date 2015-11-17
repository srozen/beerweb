class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|

      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
