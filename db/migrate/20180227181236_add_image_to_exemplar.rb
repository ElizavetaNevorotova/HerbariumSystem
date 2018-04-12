class AddImageToExemplar < ActiveRecord::Migration[5.2]
  def up
    add_attachment :exemplars, :image
  end

  def down
    remove_attachment :exemplars, :image
  end
end
