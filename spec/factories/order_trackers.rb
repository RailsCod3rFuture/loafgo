FactoryBot.define do
  factory :order_tracker do
    order_date "2018-02-28 18:12:50"
    order_created_at "MyString"
    time_delivered "MyString"
    delivery_on_time false
    order nil
    delivery nil
  end
end
