class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|

      t.string :telephone
      t.string :website
      t.string :street
      t.string :number
      t.string :zipcode
      t.string :city
      t.string :country
      t.belongs_to :beer_place, index: true, :polymorphic => true

      t.timestamps null: false
    end
  end
end
