class ManagerDashboardController < ApplicationController
  before_action :authenticate_manager!
  def index
    @trucks = Truck.all
    @recently_added_orders = Order.last(10)
    @truck_locator = Truck.order('created_at DESC').last(4)
  end
end
