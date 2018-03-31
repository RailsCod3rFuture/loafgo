module DeliveriesHelper

  def delivery_on_time_checker(delivery)
    if !delivery.delivery_on_time
      "<strong>Late</strong>".html_safe
    else
      "<strong>Yes</strong>".html_safe
    end
  end
end
