class CreateFriendStatuses < ActiveRecord::Migration
  def change
    create_table :friend_statuses do |t|

      t.timestamps null: false
    end
  end
end
