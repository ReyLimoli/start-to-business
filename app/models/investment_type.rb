class InvestmentType < ApplicationRecord
  has_many :proposals, dependent: :nullify
end
