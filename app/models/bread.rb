class Bread < ApplicationRecord
  has_many :orders
  has_many :deliveries
  has_one :inventory, dependent: :destroy
  belongs_to :warehouse, optional: true
  accepts_nested_attributes_for :inventory

end
