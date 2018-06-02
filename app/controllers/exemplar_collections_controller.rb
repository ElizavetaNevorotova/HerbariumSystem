class ExemplarCollectionsController < ApplicationController
  respond_to :js

  def index
    taxon = Taxon.where(id: params[:parent_id]).first

    @collection = if taxon.present?
                    taxon.children.pluck(:name, :id)
                  else
                    []
                  end
    @collection.unshift(['',''])
  end

  private

  def collection_params
    params.permit(:parent_id)
  end
end