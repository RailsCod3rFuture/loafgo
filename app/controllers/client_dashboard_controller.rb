class ClientDashboardController < ApplicationController
  before_action :authenticate_client!

  def index
    @my_orders = current_client.orders.last(6)
    @order_feedbacks = current_client.orders.includes(:order_feedback)
  end
end
