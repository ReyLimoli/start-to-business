class FavoriteIdea < ApplicationRecord
  belongs_to :user
  belongs_to :idea
end
