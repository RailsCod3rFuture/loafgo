class Warehouse < ApplicationRecord
  belongs_to :manager, dependent: :destroy
  has_many :trucks
  has_many :inventories
  has_many :breads, through: :inventories
end
