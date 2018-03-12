class Warehouse < ApplicationRecord
  belongs_to :manager, dependent: :destroy, optional: true
  has_many :trucks
  has_many :inventories
  has_many :breads, through: :inventories
  has_many :deliveries
end
