class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, :document, :linkedin, :birth_day, :amount_available_to_invest, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
