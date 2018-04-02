class ManagerOrderTrackerController < ApplicationController

  def index
    @manager_order_trackers = Order.all.includes(:order_tracker)
  end
end
