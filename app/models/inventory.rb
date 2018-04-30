class Inventory < ApplicationRecord
  belongs_to :bread, optional: true
  validates_numericality_of :bread_stock_quantity, :only_integer => true, :message => 'Check to see if your bread stock quantity is an integer', presence: true
end
