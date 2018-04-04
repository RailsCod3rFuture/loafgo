class OrderFinderController < ApplicationController
  before_action :authenticate_manager!

  def index
    if params[:q] && params[:q].reject {|k, v| v.blank?}.present?
    @q = Order.ransack(params[:q])
    @orders = @q.result.page(params[:page])
    else
      @q = Order.ransack
      @orders = []
    end
  end
end
