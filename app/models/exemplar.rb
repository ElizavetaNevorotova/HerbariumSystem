class Exemplar < ApplicationRecord
  enum fund: %i[main_fund urochis typical historical exchange education]
  has_many :comments
  has_many :exemplar_finders
  has_many :finders, through: :exemplar_finders, source: 'botanist', class_name: 'Botanist'
  has_many :taxons, dependent: :nullify
  has_many :exemplar_images

  validates_presence_of :inventory_id
  validates_uniqueness_of :inventory_id

  ransacker :family_id do
    Arel.sql('family.id')
  end

  ransacker :clan_id do
    Arel.sql('clan.id')
  end

  ransacker :kind_id do
    Arel.sql('kind.id')
  end
end
