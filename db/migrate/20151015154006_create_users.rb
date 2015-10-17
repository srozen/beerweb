class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :login
      t.string :password
      t.string :email
      t.string :firstName
      t.string :lastName
      t.date :birthday

      t.timestamps null: false
    end

    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
  end
end
