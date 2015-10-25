class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
