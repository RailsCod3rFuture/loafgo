class Bread < ApplicationRecord
  belongs_to :order
  belongs_to :warehouse
end
