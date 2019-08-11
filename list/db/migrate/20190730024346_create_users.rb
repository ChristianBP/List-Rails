class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, :limit => 255, :null => false
      t.string :email, :limit => 255, :default => "", :null => false
      t.string :password, :limit => 255, :null => false

      t.timestamps
    end
  end
end
