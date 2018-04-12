class CreateExemplars < ActiveRecord::Migration[5.2]
  def change
    create_table :exemplars do |t|
      t.integer :box_id
      t.integer :cupboard_id
      t.string :location
      t.string :habitat
      t.date :finded_at
      t.integer :fund

      t.timestamps
    end
  end
end
