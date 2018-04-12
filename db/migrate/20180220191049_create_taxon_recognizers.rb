class CreateTaxonRecognizers < ActiveRecord::Migration[5.2]
  def change
    create_table :taxon_recognizers do |t|
      t.integer :botanist_id
      t.integer :exemplar_id
      t.timestamps
    end
  end
end
