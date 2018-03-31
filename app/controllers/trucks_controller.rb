class TrucksController < ApplicationController
  before_action :set_truck, only: %i[show edit update destroy]
  before_action :authenticate_manager!
  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
    @new_truckers = Truck.last(4)
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show;
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
    @deliveries = Delivery.all
  end

  # GET /trucks/1/edit
  def edit;
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = current_manager.warehouse.trucks.build(truck_params)

    respond_to do |format|
      if @truck.save
        format.html {redirect_to @truck, notice: 'Truck was successfully created.'}
        format.json {render :show, status: :created, location: @truck}
      else
        format.html {render :new}
        format.json {render json: @truck.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html {redirect_to @truck, notice: 'Truck was successfully updated.'}
        format.json {render :show, status: :ok, location: @truck}
      else
        format.html {render :edit}
        format.json {render json: @truck.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html {redirect_to trucks_url, notice: 'Truck was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_truck
    @truck = Truck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def truck_params
    params.require(:truck).permit(:delivery_total, :lon, :lat, :delivery_id, :loaded_date, :truck_driver_name, :current_location_title, :current_street_address, :current_city, :current_state, :current_country)
  end
end
