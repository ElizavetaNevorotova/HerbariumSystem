class CreateExemplarImages < ActiveRecord::Migration[5.2]
  def change
    create_table :exemplar_images do |t|
      t.integer :exemplar_id
      t.timestamps
    end
  end
end
