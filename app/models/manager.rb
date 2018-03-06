class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :warehouse
  after_create :build_warehouse
  has_many :inventories, through: :warehouse
  has_many :breads, through: :warehouse
end
