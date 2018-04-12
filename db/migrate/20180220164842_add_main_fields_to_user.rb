class AddMainFieldsToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :type, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :patronymic, :string
    add_column :users, :workplace, :string
    add_column :users, :position, :string
  end

  def down
    remove_column :users, :type
    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :patronymic
    remove_column :users, :workplace
    remove_column :users, :position
  end
end
