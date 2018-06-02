class Botanist < ApplicationRecord
  has_many :exemplar_finders
  has_many :finded_exemplars, through: :exemplar_finders, source: 'exemplar', class_name: 'Exemplar'
  has_many :taxon_recognizers
  has_many :recognized_exemplars, through: :taxon_recognizers, source: 'taxon', class_name: 'Taxon'
end
