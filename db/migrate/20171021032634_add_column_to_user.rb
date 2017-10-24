class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_identifier, :string, null: false, unique: true
    add_column :users, :name, :string, null: false
  end
end
