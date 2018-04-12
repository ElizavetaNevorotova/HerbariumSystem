class Exemplar < ApplicationRecord
  enum fund: %i[main_fund urochis typical historical exchange education]
  has_many :comments
  has_many :exemplar_finders
  has_many :finders, through: :exemplar_finders, source: 'botanist', class_name: 'Botanist'
  has_many :taxons, dependent: :nullify
  has_many :exemplar_images
end
