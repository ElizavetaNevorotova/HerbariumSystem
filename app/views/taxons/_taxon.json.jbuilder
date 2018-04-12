json.extract! taxon, :id, :name, :level, :parent_id, :exemplar_id, :botanist_id, :created_at, :updated_at
json.url taxon_url(taxon, format: :json)
