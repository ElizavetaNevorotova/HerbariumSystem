class CreateExemplarFinders < ActiveRecord::Migration[5.2]
  def change
    create_table :exemplar_finders do |t|
      t.integer :botanist_id
      t.integer :exemplar_id
      t.timestamps
    end
  end
end
