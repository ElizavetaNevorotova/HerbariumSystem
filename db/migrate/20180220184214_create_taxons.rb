class CreateTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :taxons do |t|
      t.string :name
      t.integer :level
      t.integer :parent_id
      t.integer :exemplar_id
      t.integer :botanist_id

      t.timestamps
    end
  end
end
