class OrderFinderController < ApplicationController
  before_action :authenticate_manager!

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result
  end
end
