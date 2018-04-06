class ManagerOrderTrackerController < ApplicationController
  before_action :authenticate_manager!
  def index
    @manager_order_trackers = Order.all.includes(:order_tracker)
  end
end
