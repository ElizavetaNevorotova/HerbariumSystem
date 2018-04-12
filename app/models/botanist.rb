class Botanist < ApplicationRecord
  has_many :exemplar_finders
  has_many :finded_exemplars, through: :exemplar_finders, source: 'exemplar', class_name: 'Exemplar'
  has_many :taxons
  has_many :recognizers, through: :taxon_recognizers, source: 'taxon', class_name: 'Taxon'
end
