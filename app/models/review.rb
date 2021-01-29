class Review < ApplicationRecord
  belongs_to :cocktail

  validates :title, :content, :rating, presence: true
end
