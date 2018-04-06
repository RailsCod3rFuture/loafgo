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

  before_save :create_token

  def create_token
    self.token = generate_token if token.blank?
  end

  private

  def generate_token
    loop do
      token = Devise.friendly_token
      break token unless Client.where(token: token).first
    end
  end

  protected

  def confirmation_required?
    false
  end
end
