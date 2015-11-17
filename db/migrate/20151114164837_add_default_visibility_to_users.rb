class AddDefaultVisibilityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :visibility, :string, :default => 'public'
  end
end
