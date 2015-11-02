class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.float :note
      t.text :comment

      t.belongs_to :collection, index: true
      t.belongs_to :beer, index: true

      t.timestamps null: false
    end
  end
end
