class TaxonRecognizer < ApplicationRecord
  belongs_to :taxon
  belongs_to :botanist
end
