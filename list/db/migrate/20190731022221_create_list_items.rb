class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :value, :limit => 500
      t.boolean :checked, :default => false, :null => false
      t.date :dueDate
      t.belongs_to :default_list

      t.timestamps
    end
    add_foreign_key :list_items, :default_lists
  end
end
