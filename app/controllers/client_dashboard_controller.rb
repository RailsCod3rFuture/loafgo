class ClientDashboardController < ApplicationController
  before_action :authenticate_client!

  def index
    @my_orders = current_client.orders.last(1)
    @order_feedbacks = current_client.orders.includes(:order_feedback).limit(10).order('created_at DESC')
  end
end
