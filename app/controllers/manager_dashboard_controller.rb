class ManagerDashboardController < ApplicationController
  before_action :authenticate_manager!
  def index
    @trucks = Truck.order('created_at DESC').last(10)
    @recently_added_orders = Order.order('created_at DESC').last(12)
    @truck_locator = Truck.order('created_at DESC').last(4)
  end
end
