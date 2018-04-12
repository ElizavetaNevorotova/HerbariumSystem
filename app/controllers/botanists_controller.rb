class BotanistsController < ApplicationController
  before_action :set_botanist, only: [:show, :edit, :update, :destroy]

  # GET /botanists
  # GET /botanists.json
  def index
    @botanists = Botanist.all
  end

  # GET /botanists/1
  # GET /botanists/1.json
  def show
  end

  # GET /botanists/new
  def new
    @botanist = Botanist.new
  end

  # GET /botanists/1/edit
  def edit
  end

  # POST /botanists
  # POST /botanists.json
  def create
    @botanist = Botanist.new(botanist_params)

    respond_to do |format|
      if @botanist.save
        format.html { redirect_to @botanist, notice: 'Botanist was successfully created.' }
        format.json { render :show, status: :created, location: @botanist }
      else
        format.html { render :new }
        format.json { render json: @botanist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /botanists/1
  # PATCH/PUT /botanists/1.json
  def update
    respond_to do |format|
      if @botanist.update(botanist_params)
        format.html { redirect_to @botanist, notice: 'Botanist was successfully updated.' }
        format.json { render :show, status: :ok, location: @botanist }
      else
        format.html { render :edit }
        format.json { render json: @botanist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /botanists/1
  # DELETE /botanists/1.json
  def destroy
    @botanist.destroy
    respond_to do |format|
      format.html { redirect_to botanists_url, notice: 'Botanist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_botanist
      @botanist = Botanist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def botanist_params
      params.require(:botanist).permit(:first_name, :last_name, :patronymic, :position)
    end
end
