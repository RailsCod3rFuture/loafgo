class Client < ApplicationRecord

  before_validation do
    self.uid = email if uid.blank?
  end

  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :orders, dependent: :destroy
  has_many :breads, through: :orders
  has_many :order_feedbacks, through: :orders

  protected

  def confirmation_required?
    false
  end
end
