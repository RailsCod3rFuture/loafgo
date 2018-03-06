class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :set_bread
  before_action :authenticate_manager!
  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
    @bread = Bread.find(params[:bread_id])
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    @bread = Bread.find(params[:bread_id])
    @inventory.bread_id = @bread.id
    @inventory.manager = current_manager
    respond_to do |format|
      if @inventory.save
        format.html {redirect_to @inventory, notice: 'Inventory was successfully created.'}
        format.json {render :show, status: :created, location: @inventory}
      else
        format.html {render :new}
        format.json {render json: @inventory.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html {redirect_to [@bread, @inventory], notice: 'Inventory was successfully updated.'}
        format.json {render :show, status: :ok, location: @inventory}
      else
        format.html {render :edit}
        format.json {render json: @inventory.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html {redirect_to [@bread, @inventory], notice: 'Inventory was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bread
    @bread = Bread.find(params[:bread_id])
  end

  def set_inventory
    @inventory = @bread.inventories.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def inventory_params
    params.require(:inventory).permit(:bread_stock_quantity, :bread_inventory_low)
  end
end
