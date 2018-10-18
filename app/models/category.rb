class Category < ApplicationRecord
  has_many :ideas, dependent: :destroy
end
