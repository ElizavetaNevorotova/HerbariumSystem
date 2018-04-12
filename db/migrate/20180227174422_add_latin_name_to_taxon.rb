class AddLatinNameToTaxon < ActiveRecord::Migration[5.2]
  def change
    add_column :taxons, :latin_name, :string
  end
end
