class Inventory < ApplicationRecord
  belongs_to :warehouse, optional: true
  belongs_to :manager, optional: true
  belongs_to :bread
end
