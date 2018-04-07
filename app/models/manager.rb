class Manager < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :warehouse
  after_create :build_warehouse
  has_many :inventories, through: :warehouse
  has_many :breads, through: :warehouse

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Manager.where(authentication_token: token).first
    end
  end
end
