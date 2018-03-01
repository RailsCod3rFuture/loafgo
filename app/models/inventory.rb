class Inventory < ApplicationRecord
  belongs_to :manager
  has_many :breads
end
