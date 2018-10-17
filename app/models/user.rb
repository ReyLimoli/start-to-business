class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :ideas, dependent: :nullify

  attr_accessor :user_type

  validates :name, :document, :linkedin, :birth_day, presence: true
  validate :check_amount
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def check_amount
    return unless user_type == 'investor' && amount_available_to_invest.blank?

    errors[:amount_available_to_invest] << 'não pode ficar em branco'
  end
end
