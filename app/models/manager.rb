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

  protected
  def confirmation_required?
    false
  end
end
