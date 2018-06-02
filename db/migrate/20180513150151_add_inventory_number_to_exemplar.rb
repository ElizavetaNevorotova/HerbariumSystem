class AddInventoryNumberToExemplar < ActiveRecord::Migration[5.2]
  def up
    add_column :exemplars, :inventory_id, :integer
  end

  def down
    remove_column :exemplars, :inventory_id
  end
end
