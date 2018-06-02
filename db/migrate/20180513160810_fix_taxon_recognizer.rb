class FixTaxonRecognizer < ActiveRecord::Migration[5.2]
  def up
    add_column :taxon_recognizers, :taxon_id, :integer
    remove_column :taxon_recognizers, :exemplar_id
  end
end
