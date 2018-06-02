class ExemplarsController < ApplicationController
  before_action :set_exemplar, only: [:show, :edit, :update, :destroy]

  # GET /exemplars
  # GET /exemplars.json
  def index
    @q = exemplars_collection.ransack(params[:q])
    @exemplars = @q.result(distinct: true)
    respond_to do |format|
      format.html {}
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename='Список.xlsx'"
      end
    end
  end

  # GET /exemplars/1
  # GET /exemplars/1.json
  def show
    respond_to do |format|
      format.html { @comments = @exemplar.comments.order(created_at: :desc) }
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='Гербарная_этикетка-#{@exemplar.inventory_id}.xlsx'"
      }
    end
  end

  # GET /exemplars/new
  def new
    @exemplar = Exemplar.new
  end

  # GET /exemplars/1/edit
  def edit
  end

  # POST /exemplars
  # POST /exemplars.json
  def create
    @exemplar = Exemplar.new(exemplar_params)

    respond_to do |format|
      if @exemplar.save
        format.html { redirect_to @exemplar, notice: 'Exemplar was successfully created.' }
        format.json { render :show, status: :created, location: @exemplar }
      else
        format.html { render :new }
        format.json { render json: @exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exemplars/1
  # PATCH/PUT /exemplars/1.json
  def update
    respond_to do |format|
      if @exemplar.update(exemplar_params)
        format.html { redirect_to @exemplar, notice: 'Exemplar was successfully updated.' }
        format.json { render :show, status: :ok, location: @exemplar }
      else
        format.html { render :edit }
        format.json { render json: @exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exemplars/1
  # DELETE /exemplars/1.json
  def destroy
    @exemplar.destroy
    respond_to do |format|
      format.html { redirect_to exemplars_url, notice: 'Exemplar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exemplar
    @exemplar = Exemplar.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def exemplar_params
    params.require(:exemplar).permit(:box_id, :cupboard_id, :location, :habitat, :finded_at, :fund)
  end

  def exemplars_collection
    Exemplar.joins('INNER JOIN taxons AS kind ON kind.exemplar_id = exemplars.id').
      joins('INNER JOIN taxons AS clan ON kind.parent_id = clan.id').
      joins('INNER JOIN taxons AS family ON clan.parent_id = family.id')
  end
end
