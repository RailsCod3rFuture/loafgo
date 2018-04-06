class Manager < ApplicationRecord

  before_validation do
    self.uid = email if uid.blank?
  end
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :warehouse
  after_create :build_warehouse
  has_many :inventories, through: :warehouse
  has_many :breads, through: :warehouse

  before_save :create_token

  def create_token
    self.token = generate_token if token.blank?
  end

  private

  def generate_token
    loop do
      token = Devise.friendly_token
      break token unless Manager.where(token: token).first
    end
  end

  def confirmation_required?
    false
  end
end
