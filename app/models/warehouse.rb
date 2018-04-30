class Warehouse < ApplicationRecord
  belongs_to :manager, dependent: :destroy, optional: true
  has_many :trucks
  has_many :breads
  has_many :deliveries
end
