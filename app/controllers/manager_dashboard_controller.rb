class ManagerDashboardController < ApplicationController
  def index
    @orders = Order.all
    @recently_added_orders = Order.last(10)
  end
end
