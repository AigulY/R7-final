class SafetyManager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/, message: 'must include at least one lowercase letter, one uppercase letter, and one digit' }
end
