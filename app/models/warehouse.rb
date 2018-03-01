class Warehouse < ApplicationRecord
  belongs_to :manager
  has_many :trucks
end
