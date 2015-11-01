class CreateFriendlists < ActiveRecord::Migration
  def change
    create_table :friendlists do |t|
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
