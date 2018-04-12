class Taxon < ApplicationRecord
  enum level: %w[family clan kind]
  has_many :taxon_recognizers
  has_many :children, class_name: 'Taxon', foreign_key: :parent_id
  has_many :recognizers, through: :taxon_recognizers, source: 'botanist', class_name: 'Botanist'
  belongs_to :parent, class_name: 'Taxon', foreign_key: :parent_id, optional: true
  belongs_to :exemplar, optional: true
end
