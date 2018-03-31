class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[show edit update destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show;
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
    @delivery.build_delivery_order
    @orders = Order.all
    @trucks = Truck.all
  end

  # GET /deliveries/1/edit
  def edit;
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = current_manager.warehouse.deliveries.build(delivery_params)
    respond_to do |format|
      if @delivery.save
        format.html {redirect_to @delivery, notice: 'Delivery was successfully created.'}
        format.json {render :show, status: :created, location: @delivery}
      else
        format.html {render :new}
        format.json {render json: @delivery.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html {redirect_to @delivery, notice: 'Delivery was successfully updated.'}
        format.json {render :show, status: :ok, location: @delivery}
      else
        format.html {render :edit}
        format.json {render json: @delivery.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html {redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def delivery_params
    params.require(:delivery).permit(:delivery_date, :delivery_on_time, :warehouse_id, :truck_id, delivery_order_attributes: %i[order_id])
  end
end
