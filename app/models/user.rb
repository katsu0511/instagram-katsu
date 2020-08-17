class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :account_name, uniqueness: true
  has_one :profile, dependent: :destroy

  def prepare_profile
    profile || build_profile
  end
end
