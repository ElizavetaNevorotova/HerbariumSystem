class ExemplarCollectionsController < ApplicationController
  respond_to :json

  def index
    taxon = Taxon.find(params[:parent_id])

    @collection = if taxon.present?
                    taxon.children.pluck(:name, :id)
                  else
                    []
                 end
  end

  private

  def collection_params
    params.permit(:parent_id)
  end
end