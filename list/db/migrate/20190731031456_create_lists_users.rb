class CreateListsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :default_lists_users, :id => false do |t|
      t.belongs_to :default_list
      t.belongs_to :user
    end
    add_index :default_lists_users, [:default_list_id, :user_id]
    add_foreign_key :default_lists_users, :default_lists
    add_foreign_key :default_lists_users, :users
  end
end
