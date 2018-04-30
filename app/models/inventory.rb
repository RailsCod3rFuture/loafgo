class Inventory < ApplicationRecord
  belongs_to :bread, optional: true
end
