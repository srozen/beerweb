class CreateFriendStatusesFix < ActiveRecord::Migration
  def change
  	 	 

     create_table :friend_statuses do |t|
      t.string :status
      t.belongs_to :users
      t.integer :friends_id
      t.timestamps null: false
    end
  end
end
