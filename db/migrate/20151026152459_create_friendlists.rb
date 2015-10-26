class CreateFriendlists < ActiveRecord::Migration
  def change
    create_table :friendlists do |t|

      t.timestamps null: false
    end
  end
end
