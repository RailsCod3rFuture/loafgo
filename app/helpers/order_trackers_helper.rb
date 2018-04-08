module OrderTrackersHelper
  def order_tracker_shipment_status(order)
    if order.order_tracker.order_shipped
      "Bread Shipped!"
    elsif !order.order_tracker.order_shipped
      "Not Shipped"
    end
  end
end
