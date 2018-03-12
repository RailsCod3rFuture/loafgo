class OrderFinderController < ApplicationController
  before_action :authenticate_manager

  def index
    @orders = Order.all
  end
end
