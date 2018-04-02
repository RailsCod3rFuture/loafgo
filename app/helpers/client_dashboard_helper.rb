module ClientDashboardHelper

  def show_new_order_icon(order)
    if order.created_at == 24.hours.ago..Time.now
      "client-orders"
    else
      ""
    end
  end
end
