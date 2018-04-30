class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[show edit update]
  before_action :authenticate_manager!


  def show
    @orders = Order.order('created_at DESC').last(10)
  end

  # GET /warehouses/1/edit
  def edit;
  end

  # POST /warehouses
  # POST /warehouses.json
  def create
    @warehouse = current_manager.warehouse_build(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html {redirect_to @warehouse, notice: 'Warehouse was successfully created.'}
        format.json {render :show, status: :created, location: @warehouse}
      else
        format.html {render :new}
        format.json {render json: @warehouse.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /warehouses/1
  # PATCH/PUT /warehouses/1.json
  def update
    @warehouse = current_manager.warehouse

    if @warehouse.update_attributes(warehouse_params)
      flash[:success] = "Manager Warehouse Updated"
      redirect_to warehouse_path
    else
      flash[:error] = "Manager Warehouse couldn't update"
      redirect_to edit_warehouse_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_warehouse
    @warehouse = current_manager.warehouse
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def warehouse_params
    params.require(:warehouse).permit(:address, :zip_code, :delivery_men_count, :state)
  end
end
