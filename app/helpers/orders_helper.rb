module OrdersHelper

  def order_status_bg(order)
    if order.order_tracker.order_shipped
      image_tag 'orders_assets/order-processing-wallpaper.png', class: 'card-img-top img-fluid'
    elsif !order.order_tracker.order_shipped
      image_tag 'orders_assets/bread-shipped-complete', class: 'card-img-top img-fluid'
    end
  end
end
