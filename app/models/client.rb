class Client < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, dependent: :destroy
  has_many :breads, through: :orders
  has_many :order_feedbacks, through: :orders
  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  validates :telephone, format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: 'Please insert a valid telephone number for ex: 888-200-2000', presence: true}
  validates :full_name, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: 'Please remove numbers or special characters from your name', presence: true, uniqueness: true}
  validates :company, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Please verify that only letters, numbers and spaces "}
  validates :zip_code, format: {with: /\A\d{5}-\d{4}|\A\d{5}\z/, message: "Your zipcode should have the format of 12345 or 12345-1234"}
  validates :state, format: {with: /[a-zA-Z\-'\s]+/, message: "Please make sure that your state is written in letters and spaces only."}
  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Client.where(authentication_token: token).first
    end
  end
end
