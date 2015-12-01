class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :login
      t.string :password
      t.string :salt
      t.string :email
      t.string :firstName
      t.string :lastName
      t.date :birthday
      t.boolean :admin, default: false
      t.string :password_reset
      t.datetime :password_reset_sent

      t.datetime :last_connection
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end

    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
  end
end
