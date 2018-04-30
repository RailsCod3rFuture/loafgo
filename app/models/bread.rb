class Bread < ApplicationRecord
  has_many :orders
  has_many :deliveries
  has_one :inventory, dependent: :destroy
  belongs_to :warehouse, optional: true
  accepts_nested_attributes_for :inventory
  validates :bread_name, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: 'Check to make sure that no special characters were added to your bread name', presence: true}
end
