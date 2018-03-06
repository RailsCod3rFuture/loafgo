class MyOrdersController < ApplicationController
  before_action :set_my_order, only: %i[show edit update destroy]
  before_action :authenticate_client!

  # GET /my_orders
  # GET /my_orders.json
  def index
    @my_orders = current_client.orders
  end

  # GET /my_orders/1
  # GET /my_orders/1.json
  def show;
  end

  # GET /my_orders/new
  def new
    @my_order = Order.new
    @breads = Bread.all.map {|c| [c.bread_name, c.id]}
  end

  # GET /my_orders/1/edit
  def edit;
  end

  # POST /my_orders
  # POST /my_orders.json
  def create
    @my_order = current_client.orders.build(my_order_params)

    respond_to do |format|
      if @my_order.save
        format.html {redirect_to @my_order, notice: 'My order was successfully created.'}
        format.json {render :show, status: :created, location: @my_order}
      else
        format.html {render :new}
        format.json {render json: @my_order.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /my_orders/1
  # PATCH/PUT /my_orders/1.json
  def update
    respond_to do |format|
      if @my_order.update(my_order_params)
        format.html {redirect_to @my_order, notice: 'My order was successfully updated.'}
        format.json {render :show, status: :ok, location: @my_order}
      else
        format.html {render :edit}
        format.json {render json: @my_order.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /my_orders/1
  # DELETE /my_orders/1.json
  def destroy
    @my_order.destroy
    respond_to do |format|
      format.html {redirect_to my_orders_url, notice: 'My order was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_my_order
    @my_order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def my_order_params
    params.require(:order).permit(:client_name, :client_zip_code, :client_state, :lon, :lat, :client_address, :bread_name, :bread_type, :bread_quantity)
  end
end
