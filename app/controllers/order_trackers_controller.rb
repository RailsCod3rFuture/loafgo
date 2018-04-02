class OrderTrackersController < ApplicationController
  before_action :set_order_tracker, only: %i[show edit update destroy]

  # GET /order_trackers
  # GET /order_trackers.json
  def index
    @order_trackers = current_client.orders.includes(:order_tracker)
  end

  # GET /order_trackers/1
  # GET /order_trackers/1.json
  def show;
  end

  # GET /order_trackers/new
  def new
    @order_tracker = OrderTracker.new
  end

  # GET /order_trackers/1/edit
  def edit;
  end

  # POST /order_trackers
  # POST /order_trackers.json
  def create
    @order_tracker = OrderTracker.new(order_tracker_params)

    respond_to do |format|
      if @order_tracker.save
        format.html {redirect_to @order_tracker, notice: 'Order tracker was successfully created.'}
        format.json {render :show, status: :created, location: @order_tracker}
      else
        format.html {render :new}
        format.json {render json: @order_tracker.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /order_trackers/1
  # PATCH/PUT /order_trackers/1.json
  def update
    respond_to do |format|
      if @order_tracker.update(order_tracker_params)
        format.html {redirect_to manager_order_trackers_path, notice: 'Order tracker was successfully updated.'}
        format.json {render :show, status: :ok, location: @order_tracker}
      else
        format.html {render :edit}
        format.json {render json: @order_tracker.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /order_trackers/1
  # DELETE /order_trackers/1.json
  def destroy
    @order_tracker.destroy
    respond_to do |format|
      format.html {redirect_to order_trackers_url, notice: 'Order tracker was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_tracker
    @order_tracker = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_tracker_params
    params.require(:order_tracker).permit(order: %i[client_name client_zip_code client_address client_state bread_quantity], :order_tracker_attributes => [:id, :time_delivered, :delivered_on_time, :order_shipped, :order_location, :_destroy])
  end
end
